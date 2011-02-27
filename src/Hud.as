package  
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author David
	 */
	public class Hud extends Entity 
	{
		private const NOTHING : int = 0;
		private const PLACING : int = 1;
		private const DELETING : int = 2;
		
		[Embed(source = 'assets/grid.png')] private const GRID: Class;
		private var sprite : Image = new Image(GRID);
		
		private var placing : int = NOTHING;
		private var clicked: Button;
		private var toPlace : String;
		private var buttons : Array = new Array();
		private var ran : Boolean = true;
		private const OFFSETX : int = 660;
		private const OFFSETY : int = 500;
		private var hudDesc : HudDescription;
		
		private var stability : Text = new Text("100", 670, 50, 130);
		private var money : Text = new Text("100", 670, 90, 130);
		private var score : Text = new Text("100", 670, 130, 130);
		
		public function Hud() 
		{
			layer = 3;
			FP.screen.color = 0x0000FF;
			graphic = new Graphiclist();
			(graphic as Graphiclist).add(new Image(GRID));
			(graphic as Graphiclist).add(new Text("PONY", 670, 10));
			(graphic as Graphiclist).add(new Text("Stability: ", 670, 30));
			(graphic as Graphiclist).add(stability);
			(graphic as Graphiclist).add(new Text("Money: ", 670, 70));
			(graphic as Graphiclist).add(money);
			(graphic as Graphiclist).add(new Text("Score: ", 670, 110));
			(graphic as Graphiclist).add(score);
		}
		
		public override function added():void
		{

			buttons[0] = new Button(10, OFFSETY + 10, "Mushroom");
			buttons[1] = new Button(70, OFFSETY + 10, "Slick");
			buttons[2] = new Button(130, OFFSETY + 10, "Long");
			buttons[3] = new Button(190, OFFSETY + 10, "Explode");
			buttons[4] = new Button(250, OFFSETY + 10, "Crack");
			buttons[5] = new Button(310, OFFSETY + 10, "Barrel");
			buttons[6] = new Button(370, OFFSETY + 10, "Wall");
			buttons[7] = new Button(430, OFFSETY + 10, "Delete");
			buttons[8] = new Button(700, OFFSETY + 10, "Next");
			hudDesc = new HudDescription();
				
			FP.world.add(buttons[0]);
			FP.world.add(buttons[1]);
			FP.world.add(buttons[2]);
			FP.world.add(buttons[3]);
			FP.world.add(buttons[4]);
			FP.world.add(buttons[5]);
			FP.world.add(buttons[6]);
			FP.world.add(buttons[7]);
			FP.world.add(buttons[8]);
			FP.world.add(hudDesc);
		}
		
		public function	checkButtonPress():void
		{
			var open : String = "";
			for each (var button : Button in buttons)
			{
				open = button.checkClick(world.mouseX, world.mouseY)
				if (open) {
					clicked = button;
					clicked.clicked();
				}
				switch(open)
				{
					case "Delete":{
						hudDesc.SelectType(open);
						placing = DELETING;
						break;
					}
					case "Mushroom": 
					case "Pipe" : 
					case "Barrel": 
					case"Crack":
					case"Slick":
					case"Explode":
					case"Long":
					case "Wall": {
						hudDesc.SelectType(open);
						placing = PLACING;
						toPlace = open;
						break;
					}
					case "Next": {
						if (!Wavemanager.withInWave())
							Wavemanager.nextWave();
						break;
					}
					default: {	break; }
				}
				
				if (open != "")
				{
					break;
				}
			}
			
			if (open == "")
			{
				hudDesc.SelectType();
				placing = NOTHING;	
				clicked.unclick();
			}			
		}
		
		public override function update():void 
		{
			trace(placing);
			if (Input.mouseReleased)
			{
				if (placing == NOTHING)
				{
					checkButtonPress();				
				}
				else if (placing == PLACING)
				{
					var x:Number = Grid.gridX(world.mouseX);
					var y:Number = Grid.gridY(world.mouseY);
					
					if (!(x == -1 || y == -1))
					{					
						if (!Wavemanager.withInWave())
						{
							
							if (Grid.free(x, y)) 
							{
								var stu:Structure;
								switch (toPlace)
								{
									case "Mushroom":
									{
										if (States.depleteMoney(Mushroom.cost))
										{
											stu = new Mushroom(10 + x * 20, 10 + y * 20);
										}
										break;
									}
									case "Slick":
									{
										if (States.depleteMoney(Slick.cost))
										{
											stu = new Slick(10 + x * 20, 10 + y * 20);
										}
										break;
									}
									case "Barrel":
									{
										if (States.depleteMoney(Barrel.cost))
										{ 
											stu = new Barrel(10 + x * 20, 10 + y * 20);
										}
										break; 
									}
									case "Crack": 
									{ 
										
										if (States.depleteMoney(Crack.cost))
										{
											stu = new Crack(10 + x * 20, 10 + y * 20);
										}
										break; 
										}
									case "Long":
									{
										if (States.depleteMoney(Longshroom.cost))
										{
											stu = new Longshroom(10 + x * 20, 10 + y * 20);
										}
										break;
									}
									case "Explode":
									{
										if (States.depleteMoney(Splodeshroom.cost))
										{
											stu = new Splodeshroom(10 + x * 20, 10 + y * 20);
										}
										break;
									}
									case "Wall":
									{										
										if (States.depleteMoney(5))
										{
											stu = new Structure(10 + x * 20, 10 + y * 20);
										}
									}
									
								}
								if (stu)
								{
									Grid.occupy(x, y, stu);
									for each (var s : SpawnPoint in Grid.getSpawn)
									{	

										var a : Array;
										if (!(a = s.findpath()))
										{
											placing = 0;
											
											Grid.occupy(x, y,null);
											return;
										}
									}
									FP.world.add(stu);
									trace(Grid.at(x, y));
								}
							}
						}
						else 
						{						
							if (Grid.free(x, y) && !Grid.onPath(x, y)) 
							{
								switch (toPlace)
								{
									case "Mushroom": {
										stu = new Mushroom(10 + x * 20, 10 + y * 20);
										break;
									}
									case "Slick": {
										stu = new Slick(10 + x * 20, 10 + y * 20);
										break;
									}
									case "Barrel": { 
										stu = new Barrel(10 + x * 20, 10 + y * 20);
										break; 
									}
									case "Crack": { 
										stu = new Crack(10 + x * 20, 10 + y * 20);
										break; 
										}
									case "Long": {
										stu = new Longshroom(10 + x * 20, 10 + y * 20);
										break;
									}
									case "Explode": {
										stu = new Splodeshroom(10 + x * 20, 10 + y * 20);
										break;
									}
									
								}
								if (stu)
								{
									Grid.occupy(x, y, stu);
									for each (s in Grid.getSpawn)
									{
										if (!(a = s.findpath()))
										{
											placing = 0;
											Grid.occupy(x, y,null);
											return;
										}
									}
									FP.world.add(stu);
								}
							}
						}
					}
					else
					{
						hudDesc.SelectType();
						placing = NOTHING;	
						clicked.unclick();						
					}
				}
				else if (placing == DELETING)
				{
					x = Grid.gridX(world.mouseX);
					y = Grid.gridY(world.mouseY)
					
					if (!(x == -1 || y == -1))
					{
						if (!Grid.free(x, y)) 
						{
							if (Grid.at(x, y).GetType() != Structure.PLANT && Grid.at(x, y).GetType() != Structure.SPAWNPOINT)
							{
								FP.world.remove(Grid.at(x, y));
								Grid.occupy(x, y, null);
								for each (var sp : SpawnPoint in Grid.getSpawn)
								{
									sp.findpath();
								}
							}
						}
					}
					else
					{
						hudDesc.SelectType();
						placing = NOTHING;
						clicked.unclick();
					}
				}
			}
			
			stability.text = States.stability.toString();
			money.text = States.money.toString();
			score.text = States.score.toString();
		}
	}

}