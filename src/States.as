package  
{
	/**
	 * ...
	 * @author David
	 */
	public class States 
	{
		public static var power : int = 100,
							stability:Number,
							money :Number;
		
		public function States() 
		{
			
		}
		
		public static function changeMoney(x:Number):void {
			money += x;
		}
		
		public static function enoghMoney(x:Number):Boolean {
			return money > x;
		}
		
		public static function changeStability(x:Number):void {
			stability += x;
		}
		
		public static function get stability():Number {
			return stability;
		}
		
		public static function increasePower():void
		{
			power = power * 1.5 + 10;
		}
		
		public static function depletePower(toRemove : int):Boolean
		{
			return (power = power - toRemove < 0);
		}
	}

}