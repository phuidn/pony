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
							money : Number = 100,
							score : Number = 0;
							
		private static var reward : Number = 15;
		
		public function States() 
		{
			
		}
		
		public static function enoghMoney(x:Number):Boolean {
			return money > x;
		}
		
		public static function changeStability(x:Number):void {
			stability += x;
			if (stability < 0) {
				FP.world = new Losescreen(score);
			}
		}
		
		public static function Stability():Number {
			return stability;
		}
		
		public static function increaseMoney():void
		{
			money += reward;
			score += reward;
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