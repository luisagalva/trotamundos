package objects 
{
	/**
	 * ...
	 * @author LuisaGarciaAlva
	 */
	 import core.Assets;
   import starling.display.Image;
   import starling.display.Sprite;
   import starling.display.Stage;
   import starling.events.Event;
   import starling.textures.Texture;
   import states.Play;
   
   import starling.core.Starling;
   
	public class Mochilero extends Sprite
	{
		private var mochilero:Image;
		public var _width:Number;
		public var _height:Number;
		public var _xPos:Number;
		public var _yPos:Number;
		private var playNow:Play;
  	 
  	 public function Mochilero( playNow:Play, _xPos:Number = 40, _yPos:Number = 290)//pasamos una referencia a la interfaz play
  	 {
  		/* addEventListener(Event.ADDED_TO_STAGE, init);*/
		 this.playNow = playNow;
		//creamos la nueva imagen y tomamos la textura de la clase assets que creamos
  		  //Imagen de mochilero
		 mochilero = new Image( Assets.atlas_texture.getTexture("mochilero.png"));
		 
		
		 
		 //Lo posicionamos
		 mochilero.x = _xPos;
		 mochilero.y = _yPos;
		 
		 mochilero.pivotX = mochilero.width * 0.5;
  		 mochilero.pivotY = mochilero.height * 0.5;
		 addChild(mochilero);
  		 
  	 }
  	 
  	 private function init(e:Event):void
  	 {
  		 removeEventListener(Event.ADDED_TO_STAGE, init);
  		 
		 
		 
  	 }
	 
	
	 public  function update():void {
  		 //accedemos al layer nativo de flash para usar eventos de ratón
			
  	 }
  	
  	 
		
	}

}