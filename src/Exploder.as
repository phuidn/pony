package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Samy
	 */
	public class Exploder extends Entity 
	{
		[Embed(source = 'assets/blob.png')] private const BLOB: Class;
		private var speed : Number = 6,
					sprite : Image,
					velocity : Point,
					damage : int,
					initX : int,
					rangeSq : int, // The range squared of the affect
					initY : int;
					
			
		public function Exploder(x : Number, y : Number, vx : Number, vy: Number, range :int = 100000, damage:int = 20,  type:String = null) 
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
			var e: Enemy = collide("enemy", x, y) as Enemy;
			x += velocity.x * speed;
			y += velocity.y * speed;
			if (e)
			{
				var enemies :Array = [] ;
				FP.world.getClass(Enemy, enemies);
				for each (var en : Enemy in enemies)
				{
					trace((new Point(x, y).subtract(new Point(en.x, en.y))).length);
					if ((new Point(x, y).subtract(new Point(en.x, en.y))).length < 60)
						en.health -= damage;
					
				}
				world.remove(this);
			}
			else if ((x < 0 || y < 0 || x > 660 || y > 500) || rangeSq <= (initX - x) * (initX - x) + (initY - y) * (initY - y))
			{
				world.remove(this);
			}
		}
	}

}