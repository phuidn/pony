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
		
		private var loadTime : int = 30,
					eTime : int = 0,
					target : Point,
					enemies : Array = [];
		public function Mushroom(x: Number, y:Number) 
		{
			sprite = new Image(MUSHROOM);
			super(x, y, sprite);
		}
		public override function update() : void
		{
			var disTo : Number = 3600;
			FP.world.getClass(Enemy, enemies);
			for each (var e : Enemy in enemies)
			{
				if ((e.x * e.x + e.y * e.y) < disTo)
				{
					disTo = e.x * e.x + e.y * e.y;
					target = new Point(e.x, e.y);
				}
			}
			if (target && eTime>loadTime)
			{
				trace("shooting");
				target.normalize(1);
				world.add(new Projectile(x, y, target.x, target.y));
				eTime = 0;
			}
			eTime++;
		}
	}
}