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
					damage : int;
					
		protected var slowing :int = 1; // The number to divide the speed of the unit on being hit
		protected var time : int = 10; // The time of the affect
		protected var cost: int = 5; // The power cost of shooting
			
		public function Projectile(x : Number, y : Number, vx : Number, vy: Number, damage:int = 5,  type:String = null) 
		{
			switch (type)
			{
				default: sprite = new Image(BLOB);
			}
			this.damage = damage;
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
			if (x < 0 || y < 0 || x > 660 || y > 500)
				world.remove(this);
		}
	}

}