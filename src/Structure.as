package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Rob
	 */
	public class Structure extends Entity 
	{		
		protected var sprite : Image;
		
		public function Structure(x:int, y:int, sprite:Image)
		{
			this.sprite = sprite;
			super(x, y, this.sprite);
		}
		
	}

}