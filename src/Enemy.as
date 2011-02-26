package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Rob
	 */
	public class Enemy extends Entity 
	{
		[Embed(source = 'assets/enemy.png')] private const ENEMY: Class;
		protected var speed : Number = 1,
				health : int = 10;
		private var sprite : Image = new Image(ENEMY),
					path :Array,
					pathelement : int;

		public function Enemy(x : int, y : int, path : Array) 
		{
	//		Grid.occupy(5, 5, new Structure(5, 5));
			layer = 1;
			super(x, y, sprite);		
			var plant : Point = Grid.getPlant();
			this.path = path;
/*			if (path.length >2){
				for (var i:int = path.length - 3 ; i >= 0 ; i-- ) {
					if ((path[i].x == path[i + 1].x && path[i].x == path[i + 2].x))
						path.splice(i + 1 , 1);
					else  if ((path[i].y == path[i + 1].y && path[i].y == path[i + 2].y)) 
						path.splice(i + 1, 1);
					else if (((path[i].x == path[i+1].x) || (path[i+1].x ==path[i+2].x)) &&( (path[i].y == path[i+1].y) || (path[i+1].y ==path[i+2].y))) 
						path.splice(i + 1, 1);
				}
			}*/
		}
		
		public override function update() : void
		{
			/*if (path.length >1){
				var moveX:Number = path[1].x - path[0].x;
				var moveY:Number = path[1].y - path[0].y;
				this.x += moveX;
				this.y += moveY;
				if ((Grid.gridX(this.x) == path[1].x) && (Grid.gridY(y) == path[1].y))
				{
					path.splice(0, 1);
				}
			}*/
			if (pathelement < path.length - 1)
			{
				var moveX : Number = path[pathelement + 1].x - path[pathelement].x;
				var moveY : Number = path[pathelement + 1].y - path[pathelement].y;
				this.x += moveX * speed;
				this.y += moveY * speed;
				if ((Grid.gridX(this.x) == path[pathelement + 1].x) && (Grid.gridY(y) == path[pathelement + 1].y))
				{
					pathelement++;
				}
			}
			
		}
		
	}

}