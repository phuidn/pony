package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Rob
	 */
	public class Structure extends Entity 
	{
		public static const PLANT : int =  1;
		public static const SPAWNPOINT: int = 2;
		public static const MUSHROOM: int = 3;
		public static const SLICK: int = 4;
		public static const NOTHING : int = 0;
		
		protected var sprite : Image;
		[Embed(source='assets/wall.png')] private const ENEMY: Class;
		
		protected var strucType : int = NOTHING;
		
		public function Structure(x:int, y:int, sprite:Image = null)
		{
			layer = -y;
			if (sprite)
				this.sprite = sprite;
			else 
				this.sprite = new Image(ENEMY);
			super(x, y, this.sprite);
			this.sprite.y = -20;
		}
		
		public function GetType():int 
		{
			return strucType;
		}
		
		public function remove():void 
		{
			Grid.occupy(Grid.gridX(x), Grid.gridY(y), null);
			FP.world.remove(this);
		}
		
	}

}