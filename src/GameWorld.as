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
			var plant :Structure = new Plant(30, 30);
			add(plant);
			Grid.occupy(1, 1,plant);
			Grid.occupy(2, 1,plant);
			Grid.occupy(1, 2,plant);
			Grid.occupy(2, 2,plant);
			
			
			var hud : Hud = new Hud();
			add(hud);
		}
	}
}