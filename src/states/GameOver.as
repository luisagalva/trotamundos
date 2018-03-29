package states 
{
	import core.Game;
	import interfaces.IState;
	import starling.display.Sprite;
	import starling.events.Event;
	
	
	/**
	 * ...
	 * @author...
	 */
	public class GameOver extends Sprite implements IState 
	{
		private var game:Game;
		
		public function GameOver(game:Game) 
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		/* INTERFACE interfaces.IState */
		
		public function update():void 
		{
			
		}
		
		public function destroy():void 
		{
			
		}
		
	}

}