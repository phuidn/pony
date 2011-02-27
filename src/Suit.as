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
	public class Suit extends Enemy 
	{
		[Embed(source = 'assets/hazsuit.png')] private const SUIT: Class;
		private var sprite2 : Spritemap = new Spritemap(SUIT,20,40);	
		public function Suit(x : int, y : int, path : Array) 
		{
			sprite2.add("up",[0]);
			sprite2.add("down",[1]);
			sprite2.add("left",[2]);
			sprite2.add("right",[3]);
			super(x, y, path);
			health = 60;
			speed = 0.5;
			this.x = x;
			this.y = y;
			graphic = sprite2;
			sprite2.play("up");
		}
		
		public override function update() : void
		{

			if (pathelement < path.length - 1)
			{
				var moveX : Number = path[pathelement + 1].x - path[pathelement].x;
				var moveY : Number = path[pathelement + 1].y - path[pathelement].y;
				this.x += moveX * speed;
				this.y += moveY * speed;
				if (moveX>0) sprite2.play("right");
				if (moveX<0) sprite2.play("left");
				if (moveY<0) sprite2.play("up");
				if (moveY>0) sprite2.play("down");
				if ((Grid.gridX(this.x+19) == path[pathelement + 1].x) && (Grid.gridY(this.y+19) == path[pathelement + 1].y))
				{
					pathelement++;
				}
			}
			speed = 0.5;
			
			if (health < 1)
			{
				world.remove(this);
				Wavemanager.enemyDeath();
			}
			layer = -y;
		}
		
	}

}