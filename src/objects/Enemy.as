package objects 
{
	import starling.display.Sprite;
	import core.Assets;
	import starling.textures.Texture;
	import starling.display.MovieClip;
	
	
	/**
	 * ...
	 * @author LuisaGarciaAlva
	 */
	public class Enemy extends MovieClip
	{
		public var myTexture:Texture = Assets.atlas_texture.getTexture("enemy1.png");
		public var type_enemy:String = "";
		
		public function Enemy() 
		{
		
			if (Math.random() < 0.7)
		{
			type_enemy = "enemy1.png";
		}
		else
		{
			type_enemy = "enemy2.png";
		}
		
		 //pasamos el nombre de la textura desde el texture atlas, solo el nombre y la velocidad a la que corre
  		 super(Assets.atlas_texture.getTextures(type_enemy), 12);
		 //super(textures, fps);
  		 //colocamos el pivote al centro del objeto
  		 pivotX = width * 0.5;
  		 pivotY = height * 0.5;
		 
			
		}
		
	}

}