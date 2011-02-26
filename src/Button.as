package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author David
	 */
	public class Button extends Entity 
	{
		private var buttonType : String;
		private var posX : int,
		posY : int,
		heightY : int,
		widthX : int;
		
		
		[Embed(source = 'assets/enemy.png')] private const BUTTON: Class;
		private var sprite : Image = new Image(BUTTON);
		
		public function Button(posX : int, posY : int, buttonType : String, height : int = 32, width : int = 32) 
		{
			this.heightY = height;
			this.widthX = width;
			this.posX = posX;
			this.posY = posY;
			this.buttonType = buttonType;
			
			super(posX, posY, sprite);
		}
		
		public function checkClick(pointX : int, pointY : int) : String
		{
			if ((pointX >= posX && pointX < posX + widthX) && (pointY >= posY && pointY < posY + heightY))
			{
				return buttonType;
			}
			else
			{
				return null;
			}
		}
		
	}

}