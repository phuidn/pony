package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Spritemap;
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
		
		[Embed(source = 'assets/button.png')] private const BUTTON: Class;
		[Embed(source='assets/big/greenmushBIG.png')] private const GREENMUSHROOM: Class;		
		[Embed(source='assets/big/bluemushBIG.png')] private const BLUEMUSHROOM: Class;		
		[Embed(source='assets/big/redmushBIG.png')] private const REDMUSHROOM: Class;		
		[Embed(source = 'assets/Delete.png')] private const img: Class;
		[Embed(source = 'assets/next.png')] private const NEXT: Class;
		[Embed(source='assets/big/crackBIG.png')] private const CRACK: Class;
		[Embed(source='assets/big/barrelBIG.png')] private const BARREL: Class;
		[Embed(source='assets/wall.png')] private const WALL: Class;
		[Embed(source='assets/big/slickBIG.png')] private const SLICK: Class;

	
		private var sm:Spritemap = new Spritemap(BUTTON, 40, 40);			
		private var sprite : Image = new Image(BUTTON);
		
		public function Button(posX : int, posY : int, buttonType : String, height : int = 40, width : int = 40) 
		{
			sm.add("not clicked",[0]);
			sm.add("clicked",[1]);
			this.heightY = height;
			this.widthX = width;
			this.posX = posX;
			this.posY = posY;
			this.buttonType = buttonType;
			graphic = new Graphiclist();
			(graphic as Graphiclist).add(sm);
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
					break;
				}
				case "Explode":
				{
					sprite = new Image(REDMUSHROOM);
					break;
				}
				case "Long":
				{
					sprite = new Image(BLUEMUSHROOM);
					break;
				}
				case "Wall":
				{
					sprite = new Image(WALL);
					break;
				}
				case "Slick":
				{
					sprite = new Image(SLICK);
					break;
				}
				default: {
					sprite = new Image(CRACK);
					break;
				}
			}
			super(posX, posY);
			sprite.scale = 0.5;
			(graphic as Graphiclist).add(sprite);
			sm.play("not clicked");
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
		
		public function clicked():void {
			sm.play("clicked");
		}
		
		public function unclick():void {
			sm.play("not clicked");
		}
	}

}