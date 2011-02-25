package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author David
	 */
	public class Button extends Entity 
	{
		private var type : String;
		private var posX : int,
		posY : int,
		height : int,
		width : int;
		
		public function Button(posX : int, posY : int, height : int = 32, width : int = 32) 
		{
			this.height = height;
			this.width = width;
			this.posX = posX;
			this.posY = posY;
		}
		
		public function checkClick(pointX : int, pointY : int) : String
		{
			if ((pointX >= posX && pointX < posX - width) && (pointY >= posY && pointY < posY = height))
			{
				return type;
			}
			else
			{
				return null;
			}
		}
		
	}

}