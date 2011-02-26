package  
{
	/**
	 * ...
	 * @author Rob
	 * */
	public class Wavemanager
	{
		private var waveNo : Number = 1,
					wavepop : int = 10,
					wave : Array,
					sciprob : Number,
					specprob : Number;
		public function Wavemanager() 
		{
			
		}
		
		public function queuewave()
		{
			wave = [];
			var i : int;
			for (i = 0; i < wavepop; i++)
			{
				if (Math.random() < sciprob)
				{
					
				}
			}
		}
		
		public function nextEnemy() : String
		{
			var s : String;
			s = wave.shift();
			return s;
		}
	}
}