package  
{
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Rob
	 * */
	public class Wavemanager
	{
		private static var 	waveNo : Number = 0,
							wavepop : int = 10,
							alive : int,
							wave : Array,
							engineerRatio : Number = 5,
							demolitionRatio : Number = 0,
							suitRatio : Number = 0,
							inWave : Boolean = false;
		
		public static function nextWave():void
		{
			inWave = true;
			waveNo += 1;
			wavepop = (1 + waveNo) * 5;
			alive = 0;
			
			if (waveNo % 2 == 0)
			{
				demolitionRatio = 3;
			}
			else if (waveNo > 1)
			{
				suitRatio = 1 - 1 / (waveNo - 2);
				
				if (waveNo > 3)
				{
					demolitionRatio = 1 - 1 / (waveNo - 7);
				}
			}			
		}
		
		public static function getWaveHealth():int
		{
			return 10 + waveNo * 10;
		}
		
		public static function nextType():int 
		{
			if (wavepop == 0)
			{
				return 0;
			}
			var a : Number = FP.random;
			wavepop--;
			alive++;
			

			if (a < (engineerRatio / (engineerRatio + demolitionRatio + suitRatio)))
			{
				return 1;
			}
			else if (a < (engineerRatio / (engineerRatio + demolitionRatio + suitRatio) + (demolitionRatio / (engineerRatio + demolitionRatio + suitRatio))))
			{
				return 2
			}
			else
			{
				return 3;
			}
		}
		
		public static function withInWave():Boolean
		{
			return inWave;
		}
		
		public static function enemyDeath():void 
		{
			alive--;
			States.increaseMoney();
			if (wavepop <= 0 && alive == 0)
			{
				endWave();
			}
		}
		
		public static function endWave():void
		{
			inWave = false;
		}
	}
}