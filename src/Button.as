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
		[Embed(source = 'assets/greenMushroom.png')] private const GREENMUSHROOM: Class;		
		[Embed(source = 'assets/Delete.png')] private const img: Class;
		[Embed(source = 'assets/next.png')] private const NEXT: Class;
		[Embed(source = 'assets/crackbutton.png')] private const CRACK: Class;
		[Embed(source = 'assets/red mushroom.png')] private const REDMUSHROOM: Class;;
		[Embed(source = 'assets/barrel.png')] private const BARREL: Class;

				
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
					sprite = new Image(GREENMUSHROOM);
					break;
				}
				case "Next":{
					sprite = new Image(NEXT);
					break;
				}
				case "Crack":{
					sprite = new Image(CRACK);
					break;
				}
				case "Barrel":
				{
					sprite = new Image(BARREL);
					sprite.y = -20;
					break;
				}
				case "Explode":
				{
					sprite = new Image(REDMUSHROOM);
					break;
				}
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