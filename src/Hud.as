package  
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author David
	 */
	public class Hud extends Entity 
	{
		private var placing : Boolean = false;
		private var toPlace : String;
		private var buttons : Array = new Array();
		private var ran : Boolean = true;
		
		public function Hud() 
		{

		}
		
		override public function update():void 
		{
			if (ran)
			{
				var but : Button = new Button(50, 50, "Random");
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