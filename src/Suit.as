package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Rob
	 */
	public class Suit extends Enemy 
	{
		[Embed(source = 'assets/next.png')] private const SUIT: Class;
		private var sprite2 : Image = new Image(SUIT);	
		public function Suit(x : int, y : int, path : Array) 
		{
			super(x, y, path);
			health = 60;
			speed = 0.5;
			this.x = x;
			this.y = y;
			graphic = sprite2;
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