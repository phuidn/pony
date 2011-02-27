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
		public var	health : Number = 20;
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
			super(x, y-20, sprite);		
			var plant : Point = Grid.getPlant();
			this.path = path;
			sprite.originY = -20;
			type = "enemy";
			setHitbox(20, 20);
			sprite.play("up");
		}
		
		public override function update() : void
		{

			if (pathelement < path.length - 1)
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

		/*		if (moveX>0 && (Grid.gridX(this.x) == path[pathelement + 1].x) )
					pathelement++;
				if (moveX<0 && (Grid.gridX(this.x+19) == path[pathelement + 1].x) )
					pathelement++;
				if (moveY<0 && (Grid.gridX(this.y) == path[pathelement + 1].y) )
					pathelement++;
				if (moveY>0 && (Grid.gridX(this.y+19) == path[pathelement + 1].y) )
					pathelement++;

				if ((Grid.gridX(this.x + 15) == path[pathelement + 1].x) && (Grid.gridY(this.y + 15) == path[pathelement + 1].y) &&
					(Grid.gridX(this.x +5) == path[pathelement + 1].x) && (Grid.gridY(this.y +5) == path[pathelement + 1].y)  &&
					(Grid.gridX(this.x + 15) == path[pathelement + 1].x) && (Grid.gridY(this.y+5 ) == path[pathelement + 1].y) &&
					(Grid.gridX(this.x+5) == path[pathelement + 1].x) && (Grid.gridY(this.y+15) == path[pathelement + 1].y))
				{
					pathelement++;
				} */
				trace(count);
				if (count >= 20) {
					trace("UIHIH");
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
			
			if (health < 1)
			{
				world.remove(this);
				Wavemanager.enemyDeath();
			}
			
		}
		
	}

}