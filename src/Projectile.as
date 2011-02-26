package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Rob
	 */
	public class Projectile extends Entity
	{
		[Embed(source = 'assets/blob.png')] private const BLOB: Class;
		private var speed : Number = 5,
					sprite : Image = new Image(BLOB),
					velocity : Point;
			
		public function Projectile(x : Number, y : Number, vx : Number, vy: Number) 
		{
			super(x, y, sprite);
			velocity = new Point(vx, vy);
		}
		
		public override function update(): void
		{
			x += velocity.x * speed;
			y += velocity.y * speed;
		}
		
	}

}