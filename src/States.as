package  
{
	/**
	 * ...
	 * @author David
	 */
	import net.flashpunk.FP;
	
	public class States 
	{
		public static var power : Number = 100,
							stability:Number = 100,
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
			if (stability < 0) {
				FP.world = new Losescreen();
			}
		}
		
		public static function Stability():Number {
			return stability;
		}
		
		public static function increasePower():void
		{
			power = power * 1.5 + 10;
		}
		
/*		public static function depletePower(toRemove : int):Boolean
		{
			if (power >= toRemove)
			{
				power -= toRemove;
				return true;
			}
			else
			{
				return false;
			}
		}*/
	}

}