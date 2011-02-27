package  
{
	/**
	 * ...
	 * @author David
	 */
	public class States 
	{
		public static var power : int = 100;

		
		public function States() 
		{
			
		}
					
		public static function increasePower():void
		{
			power = power * 1.5 + 10;
		}
		
		public static function depletePower(toRemove : int):Boolean
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
		}
	}

}