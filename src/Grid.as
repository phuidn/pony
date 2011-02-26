package  
{
	import authoring.authObject;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Samy
	 */
	public class Grid 
	{
		private static var grid : Array = new Array();
		private static const OFFSETX:Number = 10; 
		private static const OFFSETY:Number = 10; 
		private static var plant :Point;
		private static var spawns:Array = new Array();
		public static function newGrid():void
		{
			for (var i:int = 0; i < 32; i++) {
				grid[i] = new Array();
				for (var j:int = 0 ; j < 24; j++) {
					grid[i][j] =null;
				}						
			}
		}
		
		public static function addPlant(x:int, y:int):void
		{
			plant = new Point(x, y);
		}
		
		public static function getPlant():Point
		{	
			return plant;
		}
		
		public static function addSpawn(x:int, y:int):void
		{
			spawns.push(new Point(x, y));
		}
		
		
		public static function free(x:int, y:int):Boolean 
		{
			return !grid[x][y];
		}
		
		public static function gridX(x:Number):Number 
		{
			return (int) ((x - OFFSETX) / 20);
		}
	
		public static function gridY(y:Number):Number 
		{
			return (int) ((y -OFFSETY )/ 20);
		}
		
		public static function occupy(x:int, y:int, struct:Structure):void
		{
			grid[x][y] = struct;
		}
		
		public static function findPath(a:Point, b:Point):Array
		{
			var ret:Array = new Array();
			var current :Array = new Array();
			if (a.x == b.x && a.y == b.y){ 
				trace("hEWRWE");
				return ret;
			}
			var dict :Dictionary = new Dictionary();
			var expand:Path = new Path(a, null, (a.subtract(b)).length, 0);
			while (!(expand.point.x == b.x && expand.point.y == b.y)){
				if (expand.point.x != 31){
					if (dict[new Point(expand.point.x + 1, expand.point.y)] != "done") {
						if (free(expand.point.x + 1, expand.point.y)){
							current.push(new Path(new Point(expand.point.x + 1, expand.point.y), expand,(b.subtract(new Point(expand.point.x + 1, expand.point.y))).length, expand.length + 1));
							dict[new Point(expand.point.x + 1, expand.point.y)] == "done";
						}
					}
				}
				if (expand.point.x != 0)
				{
					if (dict[new Point(expand.point.x - 1, expand.point.y)] != "done") {
						if (free(expand.point.x - 1, expand.point.y)){
							current.push(new Path(new Point(expand.point.x - 1, expand.point.y), expand, (b.subtract(new Point(expand.point.x - 1, expand.point.y))).length, expand.length + 1));						}
							dict[new Point(expand.point.x - 1, expand.point.y)] == "done";

					}
				}
				if (expand.point.y != 23)
				{
					if (dict[new Point(expand.point.x + 1, expand.point.y+1)] != "done") {
						if (free(expand.point.x , expand.point.y+1)){
							current.push(new Path(new Point(expand.point.x , expand.point.y+1), expand, (b.subtract(new Point(expand.point.x , expand.point.y+1))).length, expand.length + 1));
							dict[new Point(expand.point.x , expand.point.y+1)] == "done";
						}
						
					}
					
				}
				if (expand.point.y != 0)
				{
					if (dict[new Point(expand.point.x , expand.point.y-1)] != "done") {
						if (free(expand.point.x , expand.point.y-1)){
							current.push(new Path(new Point(expand.point.x , expand.point.y-1), expand, (b.subtract(new Point(expand.point.x , expand.point.y-1))).length, expand.length + 1));
							dict[new Point(expand.point.x , expand.point.y-1)] == "done";
						}					
					}
				}
				var d: Number =  Number.MAX_VALUE;
				var index:int = 0;
				for (var i:int = 0; i < current.length ; i++) {
					if (current[i].getH() < d) {
						d = current[i].getH();
						expand = current[i];
						index = i;
					}
				}
				current.splice(index, 1);
			}
			ret.push(expand.point);
			while (expand.last != null) {
				expand = expand.last;
				ret.push(expand.point);
			}
			return ret;
		}
	}
}