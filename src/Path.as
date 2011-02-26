package  
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Samy
	 */
	public class Path 
	{
		private static var count:int  = 0; 
		public var x:int,y:int;
		public var last:Path;
		public var distance:Number;
		public var length:Number;
		public function Path(x:int,y:int,path:Path,distance:Number,length:Number) 
		{
			count ++;
			this.x = x;
			this.y = y;
			this.last = path;
			this.distance = distance;
			this.length = length;
		}
		
		public function getH():Number {
			return this.distance +this.length;
		}
		
	}

}