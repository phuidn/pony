package  
{
	/**
	 * ...
	 * @author David
	 */
	import net.flashpunk.FP;
	
	public class States 
	{
		public static var	stability:Number = 100,
							money : Number,
							score : Number;
		
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
		
		public static function increaseMoney(toAdd : int):void
		{
			money += toAdd;
			score += toAdd;
		}
		
		public static function depleteMoney(toRemove : int):Boolean
		{
			if (money >= toRemove)
			{
				money -= toRemove;
				return true;
			}
			else
			{
				return false;
			}
		}
	}

}