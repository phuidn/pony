package 
{
	import flash.display.GradientType;
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
			super(800, 600);
			var gWorld:GameWorld = new GameWorld();
			FP.world = gWorld;
			gWorld.init();
		//	FP.console.enable();
		}
	}
	
}