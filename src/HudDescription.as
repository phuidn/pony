package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author David
	 */
	public class HudDescription extends Entity
	{		
		[Embed(source = 'assets/big/barrelBIG.png')] private const BARREL: Class;
		[Embed(source = 'assets/big/barrelBIG.png')] private const UNSELECTED: Class;
		
		protected var disImg : Image = new Image(UNSELECTED);
		protected var disText : Text = new Text("Cost: N/A",0,85);
		protected var costText : Text = new Text("Nothing Selected",0,105,80,70);
		
		public function HudDescription() 
		{			
			graphic  = new Graphiclist;
			
			(graphic as Graphiclist).add(disImg);
			(graphic as Graphiclist).add(costText);
			(graphic as Graphiclist).add(disText);
			layer = 0;
			super(690, 150);
		}		
		
		public function SelectType(selected : String):void 
		{
			switch (selected)
			{
				case "Barrel":
				{
					disImg = new Image(BARREL);
					
					costText.text = "Cost: " + Barrel.cost.toString();					
					disText.text = Barrel.description;
				}
				default:
				{
					disImg = new Image(UNSELECTED);
					costText.text = "Cost: N/A"					
					disText.text = "Nothing Selected";
					break;
				}
			}
		}
	}

}