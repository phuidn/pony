package  
{
	import flash.display.GraphicsGradientFill;
	import flash.geom.Point;
	import flash.utils.ByteArray;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Samy
	 */
	public class Barrel extends Structure 
	{
				
		//[Embed(source = 'assets/XML/Mushrooms.xml', mimeType = "application/octet-stream")] private const MUSHROOMS: Class;
		[Embed(source = 'assets/barrel.png')] private const BARREL: Class;
		
		private var damage :int = 5, // The damage the slick causes to enemies walking on it
					slowing :int = 1, // The number to divide the speed of the unit on walking in the slick
					cost: int = 10, // The power cost of buying the slick
					powerUsage : int = 1, // The power usage of the unit
					mushroomType :String= "Barrel";
		
		private var loadTime : int = 100,
					eTime : int = 0,
					target : Point = new Point(),
					enemies : Array = [],
					rangeSq : int = 50000;
	
		public function Barrel(x: Number, y:Number) 
		{
			//LoadData(this.mushroomType);
			sprite = new Image(BARREL);
			sprite.y = -20;
			super(x, y, sprite);
		}
		
		public override function update() : void
		{


			if (eTime > loadTime){			
				FP.world.getClass(Enemy, enemies);
				eTime = 0;

				for each (var e : Enemy in enemies)
				{
					if ((new Point(x, y).subtract(new Point(e.x, e.y))).length < 60) {
						e.health -= damage;		
					}
				
				}
			}
			eTime++;
			enemies = [];
		}
		

	}
}