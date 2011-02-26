package  
{
	import flash.display.GraphicsGradientFill;
	import flash.geom.Point;
	import flash.utils.ByteArray;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Rob
	 */
	public class Mushroom extends Structure 
	{
		[Embed(source = 'assets/greenMushroom.png')] private const GREEN_MUSHROOM: Class;
		[Embed(source = 'assets/XML/Mushrooms.xml', mimeType = "application/octet-stream")] private const MUSHROOMS: Class;
		private var damage :int = 1, // The damage the slick causes to enemies walking on it
					slowing :int = 1, // The number to divide the speed of the unit on walking in the slick
					cost: int = 10, // The power cost of buying the slick
					powerUsage : int = 1, // The power usage of the unit
					mushroomType :String= "Normal",
					rangeSq : int = 10000;
		
		private var loadTime : int = 30,
					eTime : int = 0,
					target : Point = new Point(),
					enemies : Array = [];
		
		public function Mushroom(x: Number, y:Number) 
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
				world.add(new Projectile(x, y, target.x, target.y));
				eTime = 0;
			}
			eTime++; 
			enemies =  [];
		}
		
		/*
		public function LoadData(type : String):Boolean 
		{
			var rawData : ByteArray = new MUSHROOMS;
			var dataString = rawData.readUTFBytes(rawData.length);
			var file : XML = new XML(dataString);
			var dataList = file.data.mushroom.mushrooms;
			var dataElement : XML;
			var found : Boolean = false;
			
			for each (dataElement in dataList)
			{
				if (String(dataElement.@type) == type)
				{
					found = true;
					damage = int(dataElement.@damage);
					slowing = int(dataElement.@slowing);
					cost = int(dataElement.@cost);
					powerUsage = int(dataElement.@powerUsage);
					rangeSq = int(dataElement.@rangeSq);
					trace(damage);
					break;
				}
			}
			
			return found;
		}
		*/
	}
}