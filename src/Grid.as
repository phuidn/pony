package  
{
	/**
	 * ...
	 * @author Samy
	 */
	public class Grid 
	{
		private var grid : Array = new Array();
		private const OFFSETX:Number = 10; 
		private const OFFSETY:Number = 10; 
		public function Grid() 
		{
			for (var i:int = 0; i < 32; i++) {
				grid[i] = new Array();
				for (var j:int = 0 ; j < 24; j++) {
					grid[i][j] = 0;
				}						
			}
		}
		
		public function free(x:int, y:int):Boolean 
		{
			return grid[x][y] == 0 ;
		}
		
		public function gridX(x:Number):Number 
		{
			return (int) ((x - OFFSETX) / 20);
		}
	
		public function gridY(y:Number):Number 
		{
			return (int) ((y -OFFSETY )/ 20);
		}
		
		public function occupy(x:int, y:int):void
		{
			grid[x][y] = 1;
		}
	}

}