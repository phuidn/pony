package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Rob
	 */
	public class Enemy extends Entity 
	{
		[Embed(source = 'assets/enemy.png')] private const ENEMY: Class;
		protected var speed : Number = 6,
				health : int = 10;
		private var sprite : Image = new Image(ENEMY);
		public function Enemy(x : int, y : int) 
		{
			layer = 1;
			super(x, y, sprite);		
		}
		
		public override function update() : void
		{
		}
	}

}