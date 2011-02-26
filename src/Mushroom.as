package  
{
	import flash.display.GraphicsGradientFill;
	import flash.geom.Point;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Rob
	 */
	public class Mushroom extends Structure 
	{
		[Embed(source = 'assets/mushroom.png')] private const MUSHROOM: Class;
		protected var damage :int = 1; // The damage the slick causes to enemies walking on it
		protected var slowing :int = 1; // The number to divide the speed of the unit on walking in the slick
		protected var cost: int = 10; // The power cost of buying the slick
		protected var powerUsage : int = 1; // The power usage of the unit
		protected var mushroomType :String= "Normal";
		
		private var loadTime : int = 30,
					eTime : int = 0,
					target : Point = new Point(),
					enemies : Array = [];
		public function Mushroom(x: Number, y:Number) 
		{
			sprite = new Image(MUSHROOM);
			super(x, y, sprite);
		}
		public override function update() : void
		{
			var disTo : Number = 3600;
			var tempDis : Number;
			FP.world.getClass(Enemy, enemies);
			for each (var e : Enemy in enemies)
			{
				tempDis = (e.x - x) * (e.x - x) + (e.y - y) * (e.y - y);
				if (tempDis < disTo)
				{
					disTo = tempDis;
					//trace(disTo);
					target.x = e.x - x; 
					target.y = e.y - y;
				}	
			}
			if (target && eTime>loadTime)
			{
				target.normalize(1);
				world.add(new Projectile(x, y, target.x, target.y));
				eTime = 0;
			}
			eTime++;
		}
	}
}