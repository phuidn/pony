package  
{
	import flash.events.IMEEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Rob
	 */
	
	public class Plant extends Structure 
	{
		[Embed(source = 'assets/planty.png')] private const PLANT_SPRITE: Class;
		
		public function Plant(x:Number, y:Number) 
		{
			strucType = PLANT;
			sprite = new Image(PLANT_SPRITE);
			layer = 1;
			super(x, y, sprite);
		}
		
		public override function update():void
		{
		}
		
	}

}