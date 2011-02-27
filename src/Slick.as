package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author David
	 */
	public class Slick extends Structure 
	{
		protected var slickType :String = "Normal";

		
		[Embed(source = 'assets/slick.png')] private const SLICKPIC: Class;
		
		protected var 	damage :Number, // The damage the slick causes to enemies walking on it
						slowing : Number, // The number to divide the speed of the unit on walking in the slick
						powerUsage : int;
					
		public static const cost : Number = 10;
		public static const description : String = "Someone has spilled    \nradioactive waste on   \nthe floor. This is     \ndamaging to walk on.";
		
			
		public function Slick(x:int, y:int,sprite:Image = null) 
		{
			type = "slick";
			setHitbox(20, 20);
			super (x, y,sprite);
			if (!sprite)
			{
				graphic= new Image(SLICKPIC);
			}
			strucType = SLICK;
			damage = 0.01; // The damage the slick causes to enemies walking on it
			slowing = 1; // The number to divide the speed of the unit on walking in the slick
			powerUsage= 1; 
		}
		
		public function get dam():Number {
			return damage;
		}
	}

}