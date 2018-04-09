package states 
{
	import core.Assets;
	import core.Game;
	import interfaces.IState;
	
	import managers.CollisionManager;
	import managers.EnemyManager;
	import managers.AmmoManager;
	
	import starling.display.Sprite;
	import starling.events.Event;
    import starling.core.Starling;
   import starling.events.Touch;
   import starling.events.TouchEvent;
   import starling.events.TouchPhase;
     import starling.textures.Texture;
   import starling.display.Image;
   
    import flash.display.Stage;
	import flash.media.SoundChannel;
   import flash.events.MouseEvent;
	
	import objects.GameBg;
	import objects.Enemy;
	import objects.Mochilero;
	import objects.Food;
	import objects.Score;
	
	
	/**
	 * ...
	 * @author Luisa Garcia
	 */
	public class Play extends Sprite implements IState 
	{
		public var game:Game;
		private var game_background:GameBg;
		public var mochilero:Mochilero;
		public var score:Score;
		
		 
		 public var enemy_manager:EnemyManager;
		 public var collision_manager:CollisionManager;
		 public var ammo_manager:AmmoManager;
		 
		 public var bool_fire:Boolean = false;
		private var myChannel:SoundChannel = new SoundChannel();
		
		private var native_stage:Stage;
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
			//añadimos una referencia a native stage de Flash para acceder a elementos del teclado
			native_stage = Starling.current.nativeStage;
		 
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//agregamos el canal a la música, iniciamos cada uno de los 9999 loops desde el inicio de la música
			myChannel = Assets.music_sound.play(0, 9999);
		 
			//Creamos la textura del fondo
			game_background = new GameBg();
			game_background.myTexture = Assets.paris_texture;
			addChild(game_background);
			
			//Agregamos nuestro personaje
			mochilero = new Mochilero(this,stage.stageWidth / 5,stage.stageHeight -220);
			//posición horizontal a la mitad de la pantalla y vertical 200 pixeles antes del fondo
			 //agregamos la nave al display list
			 addChild(mochilero);
			 
			 var food:Food = new Food();
			 food.x = 150;
			 food.y = 330;
			 addChild(food);
			 //agregamos los managers, recuerda colocar la referencia al estado Play (this)
			 enemy_manager = new EnemyManager(this);
			 ammo_manager = new AmmoManager(this);
			 collision_manager = new CollisionManager(this);
			 
			//agregamos el score
			 score = new Score();
			 //centramos el score en la pantalla
			 score.x = stage.stageWidth / 2 - score.width / 2;
			
			 //lo agregamos al display list
			 addChild(score);
			 
			 //agregamos un evento de raton AS3
			 game_background.addEventListener(TouchEvent.TOUCH, mouse_down);
			 mochilero.addEventListener(TouchEvent.TOUCH, mouse_down);
			 game_background.addEventListener(TouchEvent.TOUCH, mouse_up);
			 mochilero.addEventListener(TouchEvent.TOUCH, mouse_up);
			
		}
		
		 private function mouse_down(e:TouchEvent):void
  	 {
		 var touch:Touch = e.getTouch(game_background);
		 var touch2:Touch = e.getTouch(mochilero);
		 if (touch != null && touch.phase == TouchPhase.BEGAN || touch2 != null && touch2.phase == TouchPhase.BEGAN)
			bool_fire = true;//cambiamos el status de bool_fire a true para que el juagador pueda disparar
  		 
  	 }
  	 
  	 private function mouse_up(e:TouchEvent):void
  	 {
		 var touch:Touch = e.getTouch(game_background);
  		 var touch2:Touch = e.getTouch(mochilero);
		 //cambiamos el status de bool_fire a false, para deshabilitar el disparo
  		 if(touch != null && touch.phase == TouchPhase.ENDED || touch2 != null && touch2.phase == TouchPhase.ENDED)
		 {
			 bool_fire = false;
			 
			//resetamos fireRate de AmmoManager
		 }
		 //ammo_manager.fireRate = 0;

  	 }
		/* INTERFACE interfaces.IState */
		
		public function update():void 
		{
			game_background.update();
			mochilero.update();
			enemy_manager.update();
			 ammo_manager.update();
		  collision_manager.update();
		
		
			
		}
		
		public function destroy():void 
		{
		//primero desactivamos los eventos de raton 
		native_stage.removeEventListener(TouchEvent.TOUCH, mouse_down);
		native_stage.removeEventListener(TouchEvent.TOUCH, mouse_up);
  		 
  		 //invocamos los métodos destroy de los managers
  		 ammo_manager.destroy();
  		 enemy_manager.destroy();
		 
  		 //eliminamos este estado de juego
  		 removeFromParent(true);
  		 
  		 //detenemos la musica
  		 myChannel.stop();
		}
		
	}

}