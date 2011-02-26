package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Rob
	 */
	public class GameWorld extends World 
	{
		
		public function GameWorld() 
		{

		}
		
		public function init():void
		{
			Grid.newGrid();

			add(new Plant(30, 30));
			Grid.occupy(1, 1);
			Grid.occupy(2, 1);
			Grid.occupy(1, 2);
			Grid.occupy(2, 2);
			
			
			var hud : Hud = new Hud();
			add(hud);
		}
	}
}