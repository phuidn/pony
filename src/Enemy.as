package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author Rob
	 */
	public class Enemy extends Entity 
	{
		[Embed(source = 'assets/scientist.png')] private const ENEMY: Class;
		public var speed : Number = 1;
		public var	health : Number;
		protected var path :Array,
					pathelement : int = 0,
					sprite:Spritemap = new Spritemap(ENEMY, 20, 40),
					hitcount:int = 0,
					count:Number = 0;

		public function Enemy(x : int, y : int, path : Array) 
		{
	//		Grid.occupy(5, 5, new Structure(5, 5));
			sprite.add("up",[0]);
			sprite.add("down",[1]);
			sprite.add("left",[2]);
			sprite.add("right",[3]);
			layer = 1;
			health = Wavemanager.getWaveHealth();
			super(x, y-20, sprite);		
			var plant : Point = Grid.getPlant();
			this.path = path;
			type = "enemy";
			setHitbox(20, 20,0,-20);
			sprite.play("up");
		}
		
		public override function update() : void
		{
			
			var e :Slick = collide("slick", x, y) as Slick;
			if (e)
			{
				health -= e.dam;
			}

			var d :Crack = collide("crack", x, y) as Crack;
			if (d)
			{
				speed = 0.5;
			}

			if (path && pathelement < path.length - 1)
			{
				var moveX : Number = path[pathelement + 1].x - path[pathelement].x;
				var moveY : Number = path[pathelement + 1].y - path[pathelement].y;
				this.x += moveX * speed;
				this.y += moveY * speed;
				count += Math.abs(moveX * speed) + Math.abs(moveY * speed);
				if (moveX>0) sprite.play("right");
				if (moveX<0) sprite.play("left");
				if (moveY<0) sprite.play("up");
				if (moveY>0) sprite.play("down");

				if (count >= 20) {
					pathelement++;
					count = 0;
				}
			}else {
				hitcount++;
				if (hitcount > 100) {
					States.changeStability( -5);
					hitcount = 0;
				}
			}
			speed = 1;
			layer = -y;
			
			
			
			if (health < 1)
			{
				world.remove(this);
				Wavemanager.enemyDeath();
			}
			
		}
		
	}

}