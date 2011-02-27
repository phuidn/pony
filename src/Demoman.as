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
	public class Demoman extends Enemy 
	{
		[Embed(source = 'assets/demoman.png')] private const DEMO: Class;
		private var sprite2 : Spritemap = new Spritemap(DEMO,20,40);	
		private var building : Structure;
		private var structs :Array = [];
		public function Demoman(x : int, y : int) 
		{
			sprite2.add("up",[0]);
			sprite2.add("down",[1]);
			sprite2.add("left",[2]);
			sprite2.add("right",[3]);
			super(x, y, null);
			health = 20;
			speed = 2;
			this.x = x;
			this.y = y;
			graphic = sprite2;
			type = "enemy";
			setHitbox(20, 20);
			var disTo : Number = 10000;
			FP.world.getClass(Structure, structs);
			for each (var e : Structure in structs)
			{
				if ((new Point(x, y).subtract(new Point(e.x, e.y))).length < disTo) {
					disTo = (new Point(x, y).subtract(new Point(e.x, e.y))).length;
					building = e;
				}
			}
			path = Grid.findPath(new Point(Grid.gridX(building.x), Grid.gridY(building.y)), new Point(Grid.gridX(x), Grid.gridY(y)));
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
			}else {
				FP.world.getClass(Structure, building);
				
				for each (var e : Structure in building)
				{
					if ((new Point(x, y).subtract(new Point(e.x, e.y))).length < 60) {
						e.remove();		
					}
				}
				FP.world.remove(this);
				Wavemanager.enemyDeath();
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