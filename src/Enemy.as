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
			super(x, y, sprite);		
		}
		
		public override function update() : void
		{
			x += (Math.random() - 0.5) * 5;
			y += (Math.random() - 0.5) * 5;
		}
	}

}