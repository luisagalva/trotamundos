package objects
{
   import core.Assets;
   import starling.display.Image;
   import starling.display.Sprite;
   import starling.display.Stage;
   import starling.events.Event;
   import starling.textures.Texture;
   
   /**
    * ...
    * @author...
    */
   public class GameBg extends Sprite
   {
  	 private var bg0:Image;
  	 private var bg1:Image;
  	 //declaramos la textura desde aquí para poder modificarla desde fuera
  	 public var myTexture:Texture = Assets.aeropuerto_texture;
	 
  	 
  	 public function GameBg()
  	 {
  		 addEventListener(Event.ADDED_TO_STAGE, init);
  		 
  	 }
  	 
  	 private function init(e:Event):void
  	 {
  		 removeEventListener(Event.ADDED_TO_STAGE, init);
  		 //creamos la nueva imagen y tomamos la texturade la clase assets que creamos
  		 bg0 = new Image(myTexture);
  		 bg0.y = 0;
  		 addChild(bg0);
  		 //necesitamos otra instancia para poder hacer la animación
  		 bg1 = new Image(myTexture);
  		 //posicionamos esta instancia arriba del stage (no se ve)
  		 bg1.y = bg0.y - bg0.height;
  		 addChild(bg1);
		 
		 
  	 }
  	 
  	 public function update(bg_speed:int = 1):void {
  		 ////movemos bg0 de acuerdo al valor del parametro bg_speed, por default, la velocidad es de 1
  		 bg0.y += bg_speed;
  		 
  		 //revisamos si bg0 ha salido del área de juego
  		 //nuestra textura mide 1024x1024, todas las que usemos como fondo deben de medir 1024 para que este código funcione correctamente
  		 if (bg0.y == 600) {
  			 //si salió, entonces lo volvemos a colocar fuera del stage en la parte superior
  			 bg0.y = -600;
  		 }
  		 
  		 //hacemos lo mismo con bg1, usando el parámetro para la velocidad
  		 bg1.y += bg_speed;
  		 
  		 if (bg1.y == 600) {
  			 bg1.y = -600;
  		 }
  		 
  		 
  	 }
  	 
   }

}