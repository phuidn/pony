package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Rob
	 */
	public class Enemy extends Entity 
	{
		[Embed(source = 'assets/enemy.png')] private const ENEMY: Class;
		public var speed : Number = 1;
		public var	health : int = 20;
		private var sprite : Image = new Image(ENEMY),
					path :Array,
					pathelement : int= 0;

		public function Enemy(x : int, y : int, path : Array) 
		{
	//		Grid.occupy(5, 5, new Structure(5, 5));
			layer = 1;
			super(x, y, sprite);		
			var plant : Point = Grid.getPlant();
			this.path = path;
			type = "enemy";
			setHitbox(20, 20);
		}
		
		public override function update() : void
		{

			if (pathelement < path.length - 1)
			{
				var moveX : Number = path[pathelement + 1].x - path[pathelement].x;
				var moveY : Number = path[pathelement + 1].y - path[pathelement].y;
				this.x += moveX * speed;
				this.y += moveY * speed;
				if ((Grid.gridX(this.x+19) == path[pathelement + 1].x) && (Grid.gridY(this.y+19) == path[pathelement + 1].y))
				{
					trace(pathelement);
					pathelement++;
				}
			}
			speed = 1;
			
			if (health < 1)
			{
				world.remove(this);
				Wavemanager.enemyDeath();
			}
			
		}
		
	}

}