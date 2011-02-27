package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author David
	 */
	public class Crack extends Structure 
	{
		protected var slickType :String = "Normal";

		
		[Embed(source = 'assets/crackbutton.png')] private const CRACK: Class;
		
		protected var 	damage :Number, // The damage the slick causes to enemies walking on it
						slowing : Number, // The number to divide the speed of the unit on walking in the slick
						cost: int, // The power cost of buying the slick
						powerUsage : int; 
			
		public function Crack(x:int, y:int,sprite:Image = null) 
		{
			setHitbox(20, 20);
			super (x, y,sprite);
			if (!sprite)
			{
				graphic= new Image(CRACK);
			}
			strucType = SLICK;
			damage = 0.01; // The damage the slick causes to enemies walking on it
			slowing = 1; // The number to divide the speed of the unit on walking in the slick
			cost = 10; // The power cost of buying the slick
			powerUsage = 1; 
			type = "crack";
		}
	}

}