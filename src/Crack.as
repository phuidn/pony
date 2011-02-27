package  
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Rob
	 */
	public class Crack extends Slick 
	{
		[Embed(source = 'assets/crackbutton.png')] private const CRACK: Class;	
		public function Crack(x:Number, y:Number) 
		{
			sprite = new Image(CRACK);
			super(x, y);
			damage = 0;
			slowing = 0.2;
			layer = 1.5;
		}
		
		
	}

}