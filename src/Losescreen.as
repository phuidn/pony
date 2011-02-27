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
		
		public function Losescreen(score:Number) 
		{
			addGraphic(new Text("LOSE \n " +score.toString(), 100, 100, 100, 100));
		}
		
	}

}