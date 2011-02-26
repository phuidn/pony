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
		[Embed(source = 'assets/enemy.png')] private const ENEMY: Class;

		private var sprite2 : Image = new Image(ENEMY);
		public function Structure(x:int, y:int, sprite:Image = null)
		{
			if (sprite)
				this.sprite = sprite;
			else 
				this.sprite = sprite2;
			super(x, y, this.sprite);
		}
		
	}

}