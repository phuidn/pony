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
			var plant :Structure = new Plant(30,30);
			add(plant);
			Grid.addPlant(2, 2);
			Grid.occupy(1, 1,plant);
			Grid.occupy(2, 1,plant);
			Grid.occupy(1, 2,plant);
			Grid.occupy(2, 2, plant);
			var spawn:Structure = new SpawnPoint(590, 430);
			add(spawn);
			Grid.occupy(30, 22, spawn);
			Grid.occupy(30, 21, spawn);
			Grid.occupy(29, 22, spawn);
			/*var spawn2:Structure = new SpawnPoint(590, 30);
			add(spawn2);
			Grid.occupy(30, 2, spawn2);
			Grid.occupy(30, 1, spawn2);
			Grid.occupy(29, 2, spawn2);
 			*/var hud : Hud = new Hud();
			add(hud);
		}
	}
}