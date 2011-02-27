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
			sprite2.add("right", [3]);
			super(x, y, []);
			health = 20;
			speed = 2;
			graphic = sprite2;
			type = "enemy";
			setHitbox(20, 20);

			sprite2.play("up");
		}
		
		private function findPath():void
		{
			var disTo : Number = 10000;
			FP.world.getClass(Structure, structs);
			for each (var e : Structure in structs)
			{
				if ((new Point(x, y).subtract(new Point(e.x, e.y))).length < disTo && (e.GetType()!= Structure.SPAWNPOINT) && (e.GetType()!= Structure.PLANT)) {
					disTo = (new Point(x, y).subtract(new Point(e.x, e.y))).length;
					building = e;
				}
			}
			if (building)
				path = Grid.findPath(new Point(Grid.gridX(building.x), Grid.gridY(building.y)), new Point(Grid.gridX(x), Grid.gridY(y)));
			else 
				path = [];
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

				if (moveX>0) sprite2.play("right");
				if (moveX<0) sprite2.play("left");
				if (moveY<0) sprite2.play("up");
				if (moveY>0) sprite2.play("down");
				if (count >= 20) {
					pathelement++;
					count = 0;
				}
			}else {
				FP.world.getClass(Structure, structs);
				var i:int = 0;
				for each (var e : Structure in structs)
				{
					if ((new Point(x, y).subtract(new Point(e.x, e.y))).length < 30 && e.GetType() != Structure.SPAWNPOINT && e.GetType() != Structure.PLANT ) {
						trace(e);

						e.remove();
						i++;
					}
				}
				if (i == 0 ) {
					findPath();
					return;
					
				}
				Wavemanager.enemyDeath();
				FP.world.remove(this);
				return;
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