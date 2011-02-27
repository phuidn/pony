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
	public class Longshroom extends Structure 
	{
		[Embed(source = 'assets/bluemushroom.png')] private const BLUE:Class;		
		//[Embed(source = 'assets/XML/Mushrooms.xml', mimeType = "application/octet-stream")] private const MUSHROOMS: Class;
		private var damage :int = 2, // The damage the slick causes to enemies walking on it
					slowing :int = 1, // The number to divide the speed of the unit on walking in the slick
					powerUsage : int = 1, // The power usage of the unit
					mushroomType :String= "Normal";
					
		public static const cost : Number = 120;
		public static const description : String = "An interesting case of \nradiation causing local\nfolora and fauna to    \nattack. A long ranged  \nattack.";
		
		private var loadTime : int = 150,
					eTime : int = 0,
					target : Point = new Point(),
					enemies : Array = [],
					rangeSq : int = 100000;
	
		public function Longshroom(x: Number, y:Number) 
		{
			//LoadData(this.mushroomType);
			sprite = new Image(BLUE);
			super(x, y, sprite);
			setHitbox(20, 20);
			sprite.y = 0;
		}
		
		public override function update() : void
		{
			var disTo : Number;
			var tempDis : Number;
			disTo = rangeSq;
			target.x = 0;
			target.y = 0;
			FP.world.getClass(Enemy, enemies);
			for each (var e : Enemy in enemies)
			{
				tempDis = (e.x - x) * (e.x - x) + (e.y - y) * (e.y - y);
				
				if (tempDis < disTo)
				{
					disTo = tempDis;
					target.x = e.x - x;
					target.y = e.y - y;
				}
			}
			
			if ((target.x != 0) && (target.y != 0) && (eTime > loadTime) && (disTo < rangeSq))
			{
				target.normalize(1);
				world.add(new Bullet(x, y, target.x, target.y, rangeSq, damage));
				eTime = 0;
			}
			eTime++; 
			enemies = [];
		}
		

	}
}