package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Rob
	 */
	public class GameWorld extends World 
	{
		private var grid:Grid;
		
		public function GameWorld() 
		{

		}
		
		public function init():void
		{
			add(new Enemy(320, 240));
			add(new Plant(0, 416));
			var hud : Hud = new Hud();
			add(hud);
		}
	}
}