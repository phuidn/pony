package  
{
	/**
	 * ...
	 * @author Samy
	 */
	public class Grid 
	{
		private static var grid : Array = new Array();
		private static const OFFSETX:Number = 10; 
		private static const OFFSETY:Number = 10; 
		
		public static function newGrid():void
		{
			for (var i:int = 0; i < 32; i++) {
				grid[i] = new Array();
				for (var j:int = 0 ; j < 24; j++) {
					grid[i][j] =null;
				}						
			}
		}
		
		public static function free(x:int, y:int):Boolean 
		{
			return !grid[x][y];
		}
				
		public static function at(x:int, y:int):Structure 
		{
			return grid[x][y];
		}
		
		public static function gridX(x:Number):Number 
		{
			var ret = (int) ((x - OFFSETX) / 20);
			if (ret >= 0 && ret < 32)
			{
				return ret;
			}
			return -1;
		}
	
		public static function gridY(y:Number):Number 
		{
			var ret = (int) ((y - OFFSETY) / 20);
			if (ret >= 0 && ret < 32)
			{
				return ret;
			}
			return -1;
		}
		
		public static function occupy(x:int, y:int, struct:Structure):void
		{
			grid[x][y] = struct;
		}
	}

}