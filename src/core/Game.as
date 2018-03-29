package core
{
    import interfaces.IState;
	import starling.display.Quad;
    import starling.display.Sprite;
    import starling.events.EnterFrameEvent;
    import starling.events.Event;
    import states.GameOver;
    import states.Menu;
    import states.Play;
	import starling.display.Image;
	import starling.text.*;


	/**
     * ...
     * @author ...
     */
    public class Game extends Sprite
    {
        public static const MENU_STATE:int = 0;
        public static const PLAY_STATE:int = 1;
        public static const GAME_OVER_STATE:int = 2;
        
        private var current_state:IState;
        
        public function Game()
        {
       		 //solo hasta tener a instancia en el stage iniciamos la funcion
			addEventListener(Event.ADDED_TO_STAGE, init);

		}

		private function init(e:Event):void
		{
            //ya no necesitamos este evento
            removeEventListener(Event.ADDED_TO_STAGE, init);
            //iniciamos el juego con el menu, entonces...
            changeState(MENU_STATE);
            //agregamos un evento que actualiza el juego
            addEventListener(EnterFrameEvent.ENTER_FRAME, update);
			
			//test
		 Assets.init();
  		 /*var ss:Image = new Image(Assets.atlas_texture.getTexture("ship_01.png"));
  		 ss.x = 300;
  		 addChild(ss);*/
		// var q:Quad = new Quad(500, 500, 0xFF0000);
		 //q.x = q.y = 400;
		 //addChild(q);
		 

		 
		 //bitmap font test
  		 /*var tt2:TextField = new TextField(300, 500, "HELLO WORLD");
		 tt2.format.size = 100;
		 tt2.format.font = "myFont";
		 tt2.format.color = 0x9790AB; 
		 //tt.format = ;
  		 addChild(tt2);*/
		 
		}

		//el parametro state nos servira al cambiar de estado de juego
		public function changeState(state:int):void {
			//primero verificamos que exista un valor
			if (current_state != null) {
			//primero destruimos el estado actual del juego antes de cambiar al siguiente, que bueno que todos los estados tienen un metodo destroy!
                current_state.destroy();
                //nos aseguramos de resetear current_state y que el garbage collector
                current_state = null;
			}
			//usaremos un switch para hacer los cambios de estado
			//la variable que estaremos validando para hacer los cambios es state
			switch (state)
			{
     	  		 case MENU_STATE:
       	 		 //creamos una nueva instancia de Menu, y recuerda que necesita una referencia a la clase Game, asi que pasamos la referencia de Game al colocar la palabra clave this
				 	current_state = new Menu(this);
				break;

				case PLAY_STATE:
				 	current_state = new Play(this);
				break;

				case GAME_OVER_STATE:
 					current_state = new GameOver(this);
				break;
			}
			//finalmente agregamos la pantalla adecuada al display list,asegurate de pasarlo en un contenedor Sprite, a esta tecnica se le conoce como “cast as”
		addChild(Sprite(current_state));
		}

		//game loop
		private function update(e:EnterFrameEvent):void
		{
				//debemos actualizar los estados del juego,recuerda que cada uno de ellos hace algo distinto
				current_state.update();
		}

	}

} 