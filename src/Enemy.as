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
		private var sprite : Image = new Image(ENEMY);
		private var path :Array;

		public function Enemy(x : int, y : int) 
		{
	//		Grid.occupy(5, 5, new Structure(5, 5));
			layer = 1;
			super(x, y, sprite);		
			var plant : Point = Grid.getPlant();
			path = Grid.findPath(plant, new Point(Grid.gridX(x),Grid.gridY(y)));
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
			for  (var p :int = 0; p < path.length ;p++ )
				trace(path[p]);
		}
		
		public override function update() : void
		{
			if (path.length >1){
				var moveX:Number = path[1].x - path[0].x;
				trace(path[1].x);
				var moveY:Number = path[1].y - path[0].y;
				this.x += moveX;
				this.y += moveY;
			}
			if ((Grid.gridX(this.x) == path[1].x) && (Grid.gridY(y) == path[1].y))
				path.slice(0, 1);

		}
		
	}

}