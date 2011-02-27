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
		[Embed(source = 'assets/big/bluemushBIG.png')] private const BLUEMUSH: Class;
		[Embed(source = 'assets/big/crackBIG.png')] private const CRACK: Class;
		[Embed(source = 'assets/big/redmushBIG.png')] private const REDMUSH: Class;
		[Embed(source = 'assets/big/greenmushBIG.png')] private const GREENMUSH: Class;
		[Embed(source = 'assets/big/wallBIG.png')] private const WALL: Class;
		[Embed(source = 'assets/big/slickBIG.png')] private const SLICK: Class;
		[Embed(source = 'assets/Delete.png')] private const DELETE: Class;		
		[Embed(source = 'assets/big/blank.png')] private const UNSELECTED: Class;
		
		protected var disImg : Image = new Image(UNSELECTED);
		protected var disImg2 : Image = new Image(BARREL);
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
		
		public function SelectType(selected : String = ""):void 
		{
			switch (selected)
			{
				case "Barrel":
				{
					((graphic as Graphiclist).children)[0] = new Image(BARREL);
					
					costText.text = "Cost: " + Barrel.cost.toString();					
					disText.text = Barrel.description;
					break;
				}
				case "Mushroom":
				{
					((graphic as Graphiclist).children)[0] = new Image(GREENMUSH);
					
					costText.text = "Cost: " + Mushroom.cost.toString();					
					disText.text = Mushroom.description;
					break;
				}
				case"Crack":
				{
					((graphic as Graphiclist).children)[0] = new Image(CRACK);
					
					costText.text = "Cost: " + Crack.cost.toString();					
					disText.text = Crack.description;
					break;
				}
				case"Slick":
				{
					((graphic as Graphiclist).children)[0] = new Image(SLICK);
					
					costText.text = "Cost: " + Slick.cost.toString();					
					disText.text = Slick.description;
					break;
				}
				case"Explode":
				{
					((graphic as Graphiclist).children)[0] = new Image(REDMUSH);
					
					costText.text = "Cost: " + Splodeshroom.cost.toString();					
					disText.text = Splodeshroom.description;
					break;
				}
				case"Long":
				{
					((graphic as Graphiclist).children)[0] = new Image(BLUEMUSH);
					
					costText.text = "Cost: " + Longshroom.cost.toString();					
					disText.text = Longshroom.description;
					break;
				}
				case "Wall":
				{
					((graphic as Graphiclist).children)[0] = new Image(WALL);
					
					costText.text = "Cost: " + 2;
					disText.text = "An unstable roof has   \ncolapsed causing a wall\nto block the path.";
					break;
				}
				case "Delete":
				{
					((graphic as Graphiclist).children)[0] = new Image(DELETE);
					
					costText.text = "Cost: 0";
					disText.text = "Deletes the structures \nselected.";
					break;					
				}
				case "Pipe" : { break; }
				case "":
				default:
				{
					((graphic as Graphiclist).children)[0] = new Image(UNSELECTED);
					costText.text = "Cost: N/A"					
					disText.text = "Nothing Selected";
					break;
				}
			}
		}
	}

}