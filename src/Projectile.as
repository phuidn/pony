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
		private var speed : Number = 6,
					sprite : Image,
					velocity : Point,
					damage : int,
					initX : int,
					rangeSq : int, // The range squared of the affect
					initY : int;
					
		protected var slowing :int = 1; // The number to divide the speed of the unit on being hit
		protected var cost: int = 5; // The power cost of shooting
			
		public function Projectile(x : Number, y : Number, vx : Number, vy: Number, range :int = 10000, damage:int = 5,  type:String = null) 
		{
			switch (type)
			{
				default: 
				{
					sprite = new Image(BLOB);
					break;
				}
			}
			
			this.rangeSq = range;
			this.damage = damage;
			initX = x;
			initY = y;
			super(x, y, sprite);
			velocity = new Point(vx, vy);
			setHitbox(10, 10, 5, 5);
			type = "projectile";
		}
		
		public override function update(): void
		{
			var e: Enemy;
			x += velocity.x * speed;
			y += velocity.y * speed;
			if (e = collide("enemy", x, y) as Enemy)
			{
				e.health -= damage;
				world.remove(this);
			}
			else if ((x < 0 || y < 0 || x > 660 || y > 500) || rangeSq <= (initX - x) * (initX - x) + (initY - y) * (initY - y))
			{
				world.remove(this);
			}
		}
	}

}