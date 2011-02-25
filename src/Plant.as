package  
{
	import flash.events.IMEEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Rob
	 */
	public class Plant extends Entity 
	{
		[Embed(source = 'assets/planty.png')] private const PLANT: Class;
		private var sprite : Image = new Image(PLANT);
		public function Plant(x:Number, y:Number) 
		{
			super(x, y, sprite);
		}
		
		public override function update():void
		{
			x += (Math.random() - 0.5) * 2;
			y += (Math.random() - 0.5) * 2;
		}
		
	}

}