package core
{
   import starling.text.ITextCompositor;
   import starling.textures.Texture;
   import starling.textures.TextureAtlas;
   import starling.text.BitmapFont;
   import starling.text.TextField;
   import flash.media.Sound;
   /**
    * ...
    * @author ...
    */
   public class Assets
   {
	   
	  // [Embed(source = "/../assets/graphics/ship_01.png")]
	  // public static const Ship1:Class;
	   
  	 //primero las texturas que  serán usadas como los fondos del juego
  	 [Embed (source = "../../assets/graphics/aeropuerto.png")]
  	 private static var background_aeropuerto:Class;
  	 public static var aeropuerto_texture:Texture;
  	 
	 [Embed (source = "../../assets/graphics/paris.png")]
  	 private static var background_paris:Class;
  	 public static var paris_texture:Texture;
  	 
  	 //ahora el texture atlas
  	 //primero la textura
  	 [Embed (source = "../../assets/graphics/sprites.png")]
  	 private static var atlas:Class;
  	 //declaramos que la textura será tipo texture atlas
  	 public static var atlas_texture:TextureAtlas;
	 
  	 //ahora el XML para poder localizar las imágenes
  	 [Embed (source = "../../assets/graphics/sprites.xml", mimeType = "application/octet-stream")]
  	 //y la variable para poder manejarlo
  	 private static var atlasXML:Class;
  	 
	 
	  //sigue el bitmap font
  	 [Embed (source = "../../assets/graphics/myFont-export.png")]
  	 private static var myFont:Class;
  	 //ahora el XML (ahora .fnt)
  	 [Embed (source = "../../assets/graphics/myFont-export.fnt", mimeType = "application/octet-stream")]
  	 private static var myFontXML:Class;
	 
	 //Agregamos la música del juego
  	 [Embed (source = "../../assets/sound_fx/parisSound.mp3")]
  	 private static var MusicSound:Class;
  	 public static var music_sound:Sound;
	 
  	 public static function init():void
  	 {
  		
		  //Mis texturas de fondos
  		aeropuerto_texture = Texture.fromBitmap(new background_aeropuerto());
		paris_texture = Texture.fromBitmap(new background_paris());
		 
  		 //instanciamos el texture atlas, asegúrate de cerrar todos los paréntesis
  		 atlas_texture = new TextureAtlas(Texture.fromBitmap(new atlas), XML(new atlasXML()));
		 
		 //registremos el nuevo bitmap font
		 
		 TextField.registerBitmapFont(new BitmapFont(Texture.fromBitmap(new myFont()), XML(new myFontXML())), "myFont");
		 
		 //primero la música
  		 music_sound = new MusicSound();
  		 
  	 }
  	 
   }

}