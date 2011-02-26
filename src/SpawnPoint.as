package  
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author David
	 */
	public class SpawnPoint extends Structure 
	{
		private const BUILDING : int = 0;
		private const SPAWNING : int = 1;
		public static var gameState : int = 0;
		private static var wavePop : int  = 10,
						spawns : int = 0;
		private var spawnTime : int = 70,
					elapsedTime : int = 0,
					path : Array;
		
		public function SpawnPoint(x:int, y:int) 
		{
			super(x, y);	
			strucType = SPAWNPOINT;
			Grid.addSpawn(this);
			findpath();
		}
		
		public function findpath() : Array
		{
			path = Grid.findPath(Grid.getPlant(), new Point(Grid.gridX(x), Grid.gridY(y)));
			return path;
		}
		
		public override function update() : void
		{
			if (gameState == SPAWNING)
			{
				if (elapsedTime > spawnTime && spawns < wavePop)
				{
					world.add(new Enemy(x, y, path));
					elapsedTime = 0;
					spawns++;
				}
				elapsedTime++;
			}
		}
		
		
	}

}