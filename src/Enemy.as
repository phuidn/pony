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
					sprite:Spritemap = new Spritemap(ENEMY,20,40);

		public function Enemy(x : int, y : int, path : Array) 
		{
	//		Grid.occupy(5, 5, new Structure(5, 5));
			sprite.add("up",[0]);
			sprite.add("down",[1]);
			sprite.add("left",[2]);
			sprite.add("right",[3]);
			layer = 1;
			super(x, y, sprite);		
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
				if (moveX>0) sprite.play("right");
				if (moveX<0) sprite.play("left");
				if (moveY<0) sprite.play("up");
				if (moveY>0) sprite.play("down");

				if ((Grid.gridX(this.x+19) == path[pathelement + 1].x) && (Grid.gridY(this.y+19) == path[pathelement + 1].y))
				{
					pathelement++;
				}
			}else {
				//put the hurting plant code here, i supose
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