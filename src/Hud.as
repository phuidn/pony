package  
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
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
		
		public function Hud() 
		{
			layer = 2;
			FP.screen.color = 0x0000FF;
			super(0, 0, sprite);
		}
		
		override public function update():void 
		{
			if (ran)
			{
				buttons[0] = new Button(10, OFFSETY + 10, "Random")
				buttons[1] = new Button(40, OFFSETY + 10, "Delete")
				FP.world.add(buttons[0]);
				FP.world.add(buttons[1]);
				ran = false;
			}
			if (Input.mouseReleased)
			{
				if (placing == NOTHING)
				{
					for each (var button : Button in buttons)
					{
						var open : String = button.checkClick(world.mouseX, world.mouseY)
						
						if (open == "Delete")
						{
							placing = DELETING;
						}
						else if (open)
						{
							placing = PLACING;
							toPlace = open;
							break;
						}					
					}
				
				}
				else if (placing == PLACING)
				{
					var x:Number = Grid.gridX(world.mouseX);
					var y:Number = Grid.gridY(world.mouseY);
					placing = NOTHING;
					
					if (!(x == -1 || y == -1))
					{
						if (Grid.free(x, y)) 
						{
							var stu:Structure = new Structure(10 + x * 20, 10 +y * 20); 
							FP.world.add(stu);
							Grid.occupy(x, y,stu);
						}
					}
				}
				else if (placing == DELETING)
				{
					var x:Number = Grid.gridX(world.mouseX);
					var y:Number = Grid.gridY(world.mouseY);
					placing = NOTHING;
					
					if (!(x == -1 || y == -1))
					{
						if (!Grid.free(x, y)) 
						{
							if (Grid.at(x, y).GetType() != Structure.PLANT && Grid.at(x, y).GetType() != Structure.SPAWNPOINT)
							{
								FP.world.remove(Grid.at(x, y));
								Grid.occupy(x, y, null);
							}
						}
					}
				}
			}
		}
	}

}