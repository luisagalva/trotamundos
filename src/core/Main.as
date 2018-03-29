package core {
	
	import flash.display.Sprite;
	import starling.core.Starling;
	import core.Game;    
	public class Main extends Sprite {    
		public function Main() {
			//creamos la instancia de Starling
			var _starling:Starling = new Starling(Game, stage);
			//queremos ver cómo se comporta nuestro juego, activemos los stats
			_starling.showStats = true;
			//todo listo, ¡ejecutemos!
			_starling.start();
		}
	}

}