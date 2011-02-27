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
		[Embed(source = 'assets/big/blank.png')] private const UNSELECTED: Class;
		
		protected var disImg : Image = new Image(UNSELECTED);
		protected var disText : Text = new Text("Nothing Selected",-20,105,140,70);
		protected var costText : Text = new Text("Cost: N/A",-20,85);
		
		public function HudDescription() 
		{			
			graphic  = new Graphiclist;
			
			disText.size = 10;
			costText.size = 10;
			
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
					break;
				}
				case "Mushroom":
				{
					disImg = new Image(BARREL);
					
					costText.text = "Cost: " + Barrel.cost.toString();					
					disText.text = Barrel.description;
					break;
				}
				case"Crack":
				{
					disImg = new Image(BARREL);
					
					costText.text = "Cost: " + Crack.cost.toString();					
					disText.text = Crack.description;
					break;
				}
				case"Slick":
				{
					disImg = new Image(BARREL);
					
					costText.text = "Cost: " + Slick.cost.toString();					
					disText.text = Slick.description;
					break;
				}
				case"Explode":
				{
					disImg = new Image(BARREL);
					
					costText.text = "Cost: " + Splodeshroom.cost.toString();					
					disText.text = Splodeshroom.description;
					break;
				}
				case"Long":
				{
					disImg = new Image(BARREL);
					
					costText.text = "Cost: " + Longshroom.cost.toString();					
					disText.text = Longshroom.description;
					break;
				}
				case "Wall":
				{
					disImg = new Image(BARREL);
					
					costText.text = "Cost: " + 5;
					disText.text = "An unstable roof has   \ncolapsed causing a wall\nto block the path.";
					break;
				}
				case "Pipe" : { break; }
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