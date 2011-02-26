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
		[Embed(source = 'assets/Delete.png')] private const img: Class;
		[Embed(source = 'assets/next.png')] private const NEXT: Class;
		//[Embed(source = 'assets/crackbutton.png')] private const CRACK: Class;
		private var sprite : Image = new Image(BUTTON);
		
		public function Button(posX : int, posY : int, buttonType : String, height : int = 32, width : int = 32) 
		{
			this.heightY = height;
			this.widthX = width;
			this.posX = posX;
			this.posY = posY;
			this.buttonType = buttonType;
			
			switch(buttonType)
			{
				case "Delete":{
					sprite = new Image(img);
					break;
				}
				case "Mushroom":{
					sprite = new Image(BUTTON);
					break;
				}
				case "Next":{
					sprite = new Image(NEXT);
					break;
				}
				/*
				case "Crack":{
					sprite = new Image(CRACK);
					break;
				}
				*/
				default: {
					sprite = new Image(BUTTON);
					break;
				}
			}
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