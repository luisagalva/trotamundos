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
   import com.greensock.*;
   import com.greensock.easing.*;
   
	 

	public class Food extends Sprite
	{
			 
	//declaramos la textura desde aquí para poder modificarla desde fuer
  	 public var myTexture:Texture = Assets.atlas_texture.getTexture("baguette.png");
		
		public function Food()
  	 {
  		//creamos la nueva imagen y tomamos la texturade la clase assets que creamos
  		 
  		var food:Image = new Image(myTexture);
		//pivote al centro del objeto
  		 pivotX = width * 0.5;
  		 pivotY = height * 0.5;
  		 //pasamos el objeto al display list
  		 addChild(food);
		 TweenMax.to(food, 1, {y: this.y - 15, ease:Sine.easeOut, yoyo:true,repeat:-1});
  		 
  	 }
  	 
  	public function Update()
	 {
		 
	 }
		
	}

}