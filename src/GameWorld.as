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
			add(new Enemy(320, 240));
			add(new Plant(0, 416));
		}
		
	}

}