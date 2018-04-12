package states 
{
	import interfaces.IState;
	import starling.text.TextField;
	import starling.display.Button;
	import core.Game;
	import starling.text.*;
	import starling.core.Starling;
	import core.Assets;
	import starling.events.Event;
	import flash.display.Stage;
	import starling.display.Sprite;
	import flash.media.SoundChannel;
   import flash.events.MouseEvent;
  
	
	/**
	 * ...
	 * @author LuisaGarciaAlva
	 */
	public class Credits extends Sprite implements IState 
	{
		private var menu_button:Button;
		private var game:Game;
		public  var myScore:TextField;
		public  var ids:TextField;
		public  var matricula:TextField;
		private var myChannel:SoundChannel = new SoundChannel();
		
		
		public function Credits(game:Game) 
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void
		{
		
		removeEventListener(Event.ADDED_TO_STAGE, init);
		Assets.init();
		
		
		 myChannel = Assets.techno_sound.play(0, 9999);
		 
		  myScore = new TextField(800, 150, "0");
		 myScore.format.size = 100;
		 myScore.format.color = 0x00000F;
		 myScore.format.font = "myFont";
		 myScore.format.verticalAlign = "center";
		 addChild(myScore);
		myScore.text = "LUISA BEATRIZ GARCIA ALVA";
		
		  ids = new TextField(800, 250, "0");
		 ids.format.size = 100;
		 ids.format.color = 0x00000F;
		 ids.format.font = "myFont";
		 ids.format.verticalAlign = "center";
		 ids.text = "INGENIERIA EN DESARROLLO DE SOFTWARE";
		 addChild(ids);
		
		
		matricula = new TextField(800, 350, "0");
		 matricula.format.size = 100;
		 matricula.format.color = 0x00000F;
		 matricula.format.font = "myFont";
		 matricula.format.verticalAlign = "center";
		 matricula.text = "2787516";
		 addChild(matricula);
		
		  //Botón para ir al menu
  		 menu_button = new Button(Assets.atlas_texture.getTexture("start1.png"), "MENU", Assets.atlas_texture.getTexture("start2.png"));
  		menu_button.x = stage.stageWidth -100;
		menu_button.height = 60;
		menu_button.width = 100;
		menu_button.textFormat.font = "myFont";
		menu_button.textFormat.color = 0xD0D7E1;
		menu_button.textFormat.size = 50;
		 addChild(menu_button);
		  
		 
		 menu_button.addEventListener(Event.TRIGGERED, menuMe);
		
		}
			
		
		/* INTERFACE interfaces.IState */
		
		public function update():void 
		{
			myScore.y -= 1;
			ids.y -= 1;
			matricula.y -= 1;
			
		}
		
		public function destroy():void 
		{
			myChannel.stop();
			removeFromParent(true);
		}
		
		 private function menuMe(e:Event):void
  	 {
  		 game.changeState(Game.MENU_STATE);
  	 }
		
		
	}

}