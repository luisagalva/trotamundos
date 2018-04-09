package states 
{
	import core.Assets;
	import core.Game;
	import interfaces.IState;
	import objects.GameBg;
	import objects.Mochilero;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Button;
	import starling.text.*;
    import starling.display.Image;
	import starling.textures.Texture;
	import starling.animation.Tween;
	import starling.animation.Transitions;
	import flash.display.Stage;
	
	
	
	/**
	 * ...
	 * @author...
	 */
	public class Menu extends Sprite implements IState 
	{
		private var game:Game;
		private var game_background:GameBg;
		private var start_button:Button;
		private var mochilero:Image;
		private var plane:Image;
		
		
		public function Menu(game:Game) 
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void
		{
		
			removeEventListener(Event.ADDED_TO_STAGE, init);
		Assets.init();
		
		//creamos la instancia de GameBg para el fondo
  		 game_background = new GameBg();
  		game_background.myTexture = Assets.aeropuerto_texture;
  		 //agregamos el objeto al display list
  		 addChild(game_background);
		 
		 //Agregamos el avion
		 plane = new Image(Assets.atlas_texture.getTexture("plane.png"));
		 plane.width = plane.width * .5; 
		 plane.height = plane.height * .5; 
		 plane.y = 200;
		 plane.x = -300;
		 addChild(plane);
		 
		 //Botón para iniciar
  		 start_button = new Button(Assets.atlas_texture.getTexture("start1.png"), "START", Assets.atlas_texture.getTexture("start2.png"));
  		 start_button.x = stage.stageWidth / 2 - start_button.width / 2;
		start_button.y = (stage.stageHeight / 3)*2;
		start_button.textFormat.font = "myFont";
		start_button.textFormat.color = 0xD0D7E1;
		start_button.textFormat.size = 350;
		 addChild(start_button);
		 
		  //Titulo del juego
  		 var tt:TextField = new TextField(600, 230, "TROTAMUNDOS");
		 tt.x = stage.stageWidth / 2 - tt.width / 2;
		 tt.y = 70;
		 tt.format.size = 230;
		 tt.format.font = "myFont";
		 tt.format.color = 0xF74440; 
		 //tt.format = ;
  		 addChild(tt);
		 
		
		 //creamos la instancia de Mochilero
  		mochilero = new Image( Assets.atlas_texture.getTexture("mochilero.png"));
		 mochilero.height = 340 ;
		 mochilero.width = 265 ;
		 
		 //Lo posicionamos
		 mochilero.x = 40;
		 mochilero.y = 290;
  		 //agregamos el objeto al display list
  		 addChild(mochilero);
		 
		 
		 //tween para aimar el avion
		 Starling.juggler.tween(plane, 3, {transition:Transitions.EASE_IN, y: -100, x:800, repeatCount: 10000*1000});
		 
		 
		 start_button.addEventListener(Event.TRIGGERED, playMe);
		 
		}
		
		 private function playMe(e:Event):void
  	 {
  		 game.changeState(Game.PLAY_STATE);
  	 }
		
		
		/* INTERFACE interfaces.IState */
		
		public function update():void 
		{
		//activamos la función update que reside en GameBg, colocamos un número para hacer cambios en la velocidad
  		 
		}
		
		public function destroy():void 
		{
			 removeFromParent(true);
		}
		
	}

}