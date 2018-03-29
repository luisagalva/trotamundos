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
   
	public class Mochilero extends Sprite
	{
		private var bg2:Image;
		public var mochilero:Texture = Assets.atlas_texture.getTexture("mochilero.png");
	 
  	 
  	 public function Mochilero()
  	 {
  		 addEventListener(Event.ADDED_TO_STAGE, init);
  		 
  	 }
  	 
  	 private function init(e:Event):void
  	 {
  		 removeEventListener(Event.ADDED_TO_STAGE, init);
  		 //creamos la nueva imagen y tomamos la texturade la clase assets que creamos
  		  //Imagen de mochilero
		 bg2 = new Image(mochilero);
		 bg2.y = 270;
		 bg2.height = 334;
		 bg2.width = 265;
		 addChild(bg2);
		 
		 
  	 }
	 
	 public function walk(bg_speed:int = 1):void {
		 
		
  		 
  		 
  	 }
  	 
  	
  	 
		
	}

}