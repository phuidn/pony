package  
{
	/**
	 * ...
	 * @author Samy
	 */
	public class Longshroom extends Structure 
	{
				
		//[Embed(source = 'assets/XML/Mushrooms.xml', mimeType = "application/octet-stream")] private const MUSHROOMS: Class;
		private var damage :int = 5, // The damage the slick causes to enemies walking on it
					slowing :int = 1, // The number to divide the speed of the unit on walking in the slick
					cost: int = 10, // The power cost of buying the slick
					powerUsage : int = 1, // The power usage of the unit
					mushroomType :String= "Normal";
		
		private var loadTime : int = 100,
					eTime : int = 0,
					target : Point = new Point(),
					enemies : Array = [],
					rangeSq : int = 100000;
	
		public function Longshroom(x: Number, y:Number) 
		{
			//LoadData(this.mushroomType);
			sprite = new Image(GREEN_MUSHROOM);
			super(x, y, sprite);
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