package  
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Samy
	 */
	public class Losescreen extends World 
	{
		
		public function Losescreen() 
		{
			addGraphic(new Text("LOSE", 100, 100, 100, 100));
		}
		
	}

}