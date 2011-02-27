package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author David
	 */
	public class HudDescription extends Entity
	{
		protected var disImg : Image;
		protected var disText : Text;
		
		public function HudDescription() 
		{
			
		}		
		
		public function SelectType(selected : String):void 
		{
			switch (selected)
			{
				default:
				{
					disImg.visible = false;
					break;
				}
			}
		}
	}

}