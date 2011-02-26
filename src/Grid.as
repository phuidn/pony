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
		
		public static function addSpawn(s : SpawnPoint):void
		{
			spawns.push(s);
		}
		
		public static function get getSpawn() : Array
		{
			return spawns;
		}
		
		public static function free(x:int, y:int):Boolean 
		{
			return !grid[x][y];
		}
				
		public static function at(x:int, y:int):Structure 
		{
			return grid[x][y];
		}
		
		public static function gridX(x:Number):int
		{
			var ret:Number = (int) ((x - OFFSETX) / 20);
			if (ret >= 0 && ret < 32)
			{
				return ret;
			}
			return -1;
		}
	
		public static function gridY(y:Number):int
		{
			var ret:Number = (int) ((y - OFFSETY) / 20);
			if (ret >= 0 && ret < 24)
			{
				return ret;
			}
			return -1;
		}
		
		public static function occupy(x:int, y:int, struct:Structure):void
		{
			grid[x][y] = struct;
		}
		
		public static function findPath(a:Point, b:Point):Array
		{
			var ret:Array = new Array(),
				count : int = 0;
			var current :Array = new Array();
			if (a.x == b.x && a.y == b.y){ 
				return ret;
			}
			var dict :Dictionary = new Dictionary();
			dict[(new Point(a.x,a.y)).toString()] = "done";
			var expand:Path = new Path(a.x, a.y, null, (a.subtract(b)).length, 0);
			while (!(expand.x == b.x && expand.y == b.y)) {
				if (expand.x != 31) {
					if (dict[(new Point(expand.x+1,expand.y)).toString()] != "done"){
						if (free(expand.x + 1, expand.y)) {
							current.push(new Path(expand.x + 1, expand.y, expand,(b.subtract(new Point(expand.x + 1, expand.y))).length, expand.length + 1));
							dict[(new Point(expand.x + 1, expand.y)).toString()] = "done";
						}		
					}
				}
				if (expand.x != 0)
				{
					if (dict[(new Point(expand.x-1,expand.y)).toString()] != "done"){
						if (free(expand.x - 1, expand.y)){
							current.push(new Path(expand.x - 1, expand.y, expand, (b.subtract(new Point(expand.x - 1, expand.y))).length, expand.length + 1));	
							dict[(new Point(expand.x - 1, expand.y)).toString()] = "done";					
						}
					}
				}
				if (expand.y != 23)
				{
					if (dict[(new Point(expand.x,expand.y+1)).toString()] != "done"){
						if (free(expand.x , expand.y+1)){
							current.push(new Path(expand.x , expand.y+1, expand, (b.subtract(new Point(expand.x , expand.y+1))).length, expand.length + 1));
							dict[(new Point(expand.x , expand.y+1)).toString()] = "done";					
						}
					}
				
				}
				if (expand.y != 0)
				{
					if (dict[(new Point(expand.x,expand.y-1)).toString()] != "done"){
						if (free(expand.x , expand.y-1)){
							current.push(new Path(expand.x , expand.y-1, expand, (b.subtract(new Point(expand.x , expand.y-1))).length, expand.length + 1));
							dict[(new Point(expand.x , expand.y-1)).toString()] = "done";					
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
				if (++count > 768)
				{
					return null;
				}
			}
			ret.push(new Point(expand.x,expand.y));
			while (expand.last != null) {
				expand = expand.last;
				ret.push(new Point(expand.x,expand.y));
			}
			return ret;
		}
	}
}