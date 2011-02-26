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
				[Embed(source = 'assets/grid.png')] private const GRID: Class;
		private var sprite : Image = new Image(GRID);
		
		private var placing : Boolean = false;
		private var toPlace : String;
		private var buttons : Array = new Array();
		private var ran : Boolean = true;
		private const OFFSETX : int = 660;
		private const OFFSETY : int = 500;
		
		public function Hud() 
		{
			FP.screen.color = 0x0000FF;
			
			super(0, 0, sprite);
		}
		
		override public function update():void 
		{
			if (ran)
			{
				var but : Button = new Button(10, OFFSETY + 10, "Random");
				buttons[0] = but;
				FP.world.add(but);
				ran = false;
			}
			if (Input.mouseReleased)
			{
				for each (var button : Button in buttons)
				{
					var open : String = button.checkClick(world.mouseX, world.mouseY)
					
					if (open)
					{
						trace(open);
					}					
				}
			}
		}
		
	}

}