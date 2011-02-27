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
	public class Splodeshroom extends Structure 
	{
		[Embed(source='assets/red mushroom.png')]private const SHROOM: Class;
		private var damage :int = 5, // The damage the slick causes to enemies walking on it
					slowing :int = 1, // The number to divide the speed of the unit on walking in the slick
					powerUsage : int = 1, // The power usage of the unit
					mushroomType :String = "Normal";					
					
		public static const cost : Number = 10;
		
		private var loadTime : int = 100,
					eTime : int = 0,
					target : Point = new Point(),
					enemies : Array = [],
					rangeSq : int = 50000;
	
		public function Splodeshroom(x: Number, y:Number) 
		{
			//LoadData(this.mushroomType);
			//sprite = new Image(GREEN_MUSHROOM);
			super(x, y, sprite);
			graphic = new Image(SHROOM);
			graphic.y = -20;
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
				world.add(new Exploder(x, y, target.x, target.y, rangeSq, damage));
				eTime = 0;
			}
			eTime++; 
			enemies = [];
			layer = -y;
		}
		

	}
}