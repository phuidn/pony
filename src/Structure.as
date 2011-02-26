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
		public static const PLANT : int =  1;
		public static const SPAWNPOINT: int = 2;
		public static const NOTHING : int = 0;
		
		protected var sprite : Image;
		
		[Embed(source = 'assets/enemy.png')] private const ENEMY: Class;
		protected var strucType : int = NOTHING;
		
		public function Structure(x:int, y:int, sprite:Image = null)
		{
			if (sprite)
				this.sprite = sprite;
			else 
				this.sprite = new Image(ENEMY);
			super(x, y, this.sprite);
		}
		
		public function GetType():int 
		{
			return strucType;
		}
		public override function update() : void
		{
		
		}
		
	}

}