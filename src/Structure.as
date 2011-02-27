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
		[Embed(source = 'assets/enemy.png')] private const ENEMY: Class;
		
		protected var strucType : int = NOTHING;
		
		public function Structure(x:int, y:int, sprite:Image = null)
		{
			layer = 2;
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
		
		public function remove ():void 
		{
			FP.world.remove(this);
		}
		
	}

}