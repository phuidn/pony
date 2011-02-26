package  
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author David
	 */
	public class SpawnPoint extends Structure 
	{
		private var spawnTime : int = 94,
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
			if (Wavemanager.withInWave())
			{
				if (elapsedTime > spawnTime)
				{
					switch (Wavemanager.nextType())
					{
						case 1: case 2: case 3:
						{
							world.add(new Enemy(x, y, path));
							break;
						}
						default:
						{
							break;
						}
					}
					elapsedTime = 0;
				}
				elapsedTime++;
			}
		}	
	}

}