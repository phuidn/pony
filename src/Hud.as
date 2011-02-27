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
		
		private var toPlace : String;
		private var buttons : Array = new Array();
		private var ran : Boolean = true;
		private const OFFSETX : int = 660;
		private const OFFSETY : int = 500;
		
		private var text : Text = new Text("100", 670, 50, 130);
		
		public function Hud() 
		{
			layer = 3;
			FP.screen.color = 0x0000FF;
			graphic = new Graphiclist();
			(graphic as Graphiclist).add(new Image(GRID));
			(graphic as Graphiclist).add(new Text("PONY", 670, 10));
			(graphic as Graphiclist).add(new Text("Power: ", 670, 30));
			(graphic as Graphiclist).add(text);			
		}
		
		public override function added():void
		{
				buttons[0] = new Button(10, OFFSETY + 10, "Mushroom");
				buttons[1] = new Button(40, OFFSETY + 10, "Delete");
				buttons[2] = new Button(70, OFFSETY + 10, "Next");
				buttons[3] = new Button(100, OFFSETY + 10, "Crack");
				FP.world.add(buttons[0]);
				FP.world.add(buttons[1]);
				FP.world.add(buttons[2]);
				FP.world.add(buttons[3]);
		}
		
		public override function update():void 
		{
			if (!Wavemanager.withInWave())
			{				
				if (Input.mouseReleased)
				{
					if (placing == NOTHING)
					{
						for each (var button : Button in buttons)
						{
							var open : String = button.checkClick(world.mouseX, world.mouseY)
							switch(open)
							{
								case "Delete":{
									placing = DELETING;
									break;
								}
								case "Mushroom": case "Pipe" : case "Barrel": case"Crack":{
									placing = PLACING;
									toPlace = open;
									break;
								}
								case "Next":{
									Wavemanager.nextWave();
									break;
								}
								default: {	break; }
							}
						}
					
					}
					else if (placing == PLACING)
					{
						var x:Number = Grid.gridX(world.mouseX);
						var y:Number = Grid.gridY(world.mouseY);
						
						if (!(x == -1 || y == -1))
						{
							if (Grid.free(x, y)) 
							{
								var stu:Structure;
								var trap:Slick;
								switch (toPlace)
								{
									case "Mushroom":
									{
										if (States.depletePower(10))
										{
											stu = new Mushroom(10 + x * 20, 10 + y * 20);
										}
										break;
									}
									case "Pipe": { break;}
									case "Barrel": { break; }
									case "Crack": 
									{
										if (States.depletePower(10))
										{
											trap = new Slick(10 + x * 20, 10 + y * 20);
										}
										break;
									}
									
								}
								if (stu)
								{
								//	if (Grid.at(x, y))
								//		Grid.at(x, y).removed();
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
								}
								if (trap)
								{
									world.add(trap);
								}
							}
						}
						else
						{
							placing = NOTHING;							
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
							placing = NOTHING;
						}
					}
				}
			}
			
			text.text = States.power.toString();
		}
	}

}