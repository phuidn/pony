package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author David
	 */
	public class Slick extends Entity 
	{
		protected var slickType :String= "Normal";
		protected var damage :int = 1; // The damage the slick causes to enemies walking on it
		protected var slowing : int = 1; // The number to divide the speed of the unit on walking in the slick
		protected var cost: int = 10; // The power cost of buying the slick
		protected var powerUsage = 1; // The power usage of the unit
		
		[Embed(source = 'assets/slick.png')] private const SLICK: Class;		
		protected var sprite : Image;
		
		
		public function Slick(x:int, y:int) 
		{
			if (!sprite)
			{
				this.sprite = new Image(SLICK);
			}
			super (x, y, sprite);
		}
		
		public override function update(): void
		{
			var e :Enemy = collide("enemy", x, y) as Enemy;
			if (e)
			{
				e.health -= damage;
				e.speed *= slowing;
			}
		}
		
	}

}