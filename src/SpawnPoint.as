package  
{
	import flash.geom.Point;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author David
	 */
	public class SpawnPoint extends Structure 
	{
		[Embed(source = 'assets/spawn.png')] private const SPAWN: Class;

		private var spawnTime : int = 94,
					elapsedTime : int = 0,
					path : Array;
		
		public function SpawnPoint(x:int, y:int) 
		{
			super(x, y);	
			strucType = SPAWNPOINT;
			Grid.addSpawn(this);
			graphic = new Image(SPAWN);
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
						case 1: 
						{
							world.add(new Enemy(x, y, path));
							break;
						}
						case 2:
						{
							world.add(new Suit(x, y, path));
							break;
						}	
						case 3: {
							world.add(new Demoman(x, y));
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
		
		public function get getPath():Array {
			return path;
		}
	}

}