package states 
{
	import core.Game;
	import interfaces.IState;
	import objects.Food;
	import starling.display.Sprite;
	import starling.events.Event;
	import objects.GameBg;
	import core.Assets;
	import objects.Mochilero;
	
	
	/**
	 * ...
	 * @author...
	 */
	public class Play extends Sprite implements IState 
	{
		private var game:Game;
		private var game_background:GameBg;
		private var mochilero:Mochilero;
		
		//Actividad 9 Crear 50 objetos, puede ser el mismo objeto, en la pantalla de juego. 
		public var posy_food:int = 100;
	    public var counter_x:int = 100;
		public var food:Food;
		private var counter:int = 0;
	
		
		public function Play(game:Game) 
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//Creamos la textura del fondo
			game_background = new GameBg();
			game_background.myTexture = Assets.paris_texture;
			addChild(game_background);
			
			//Agregamos nuestro personaje
			mochilero = new Mochilero(.7,.7,stage.stageWidth / 5,stage.stageHeight - 300);
			//posición horizontal a la mitad de la pantalla y vertical 200 pixeles antes del fondo
			
			 //agregamos la nave al display list
			 addChild(mochilero);
		}
		
		
		/* INTERFACE interfaces.IState */
		
		public function update():void 
		{
			game_background.update();
			mochilero.update();
			
			if (counter < 50)
		 {
			 
			 //agregamos nuestra nave
			 food = new Food(); //this es la referencia a la misma clase Play
			 //posición horizontal a la mitad de la pantalla y vertical 200 pixeles antes del fondo
			 food.x = counter_x;
			 if(counter != 0 && counter % 10 == 0)
			 {
				 posy_food += 50;
				 counter_x = 100;
			 }
			 //agregamos la nave al display list
			 food.y = posy_food;
			 counter_x += 50;
			 food.x = counter_x;
			 addChild(food);
			 counter++;
		 }
			
		}
		
		public function destroy():void 
		{
			
		}
		
	}

}