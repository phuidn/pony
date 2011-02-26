package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Rob
	 */
	public class GameWorld extends World 
	{
		private var gird:Array = new Array();
		
		public function GameWorld() 
		{
			add(new Enemy(320, 240));
			add(new Plant(0, 416));
			for (var i:int = 0; i < 20; i++) {
				grid[i] = new Array();
				for (var j:int = 0 ; j < 15; j++) {
					grid[i][j] = 0;
				}						
			}
		}
	}
}