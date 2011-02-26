package  
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author David
	 */
	public class Slick extends Structure 
	{
		[Embed(source = 'assets/mushroom.png')] private const SLICK: Class;
		
		public function Slick() 
		{
			sprite = new Image(SLICK);
			super (x, y, sprite);
		}
		
	}

}