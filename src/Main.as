package 
{
	import net.flashpunk.Engine;
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Rob
	 */
	public class Main extends  Engine
	{
		
		public function Main():void 
		{
			super(640, 480);
			FP.world = new GameWorld();
			FP.console.enable();
		}
	}
	
}