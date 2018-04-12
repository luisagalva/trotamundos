package objects 
{
	import starling.display.MovieClip;
	  import starling.textures.Texture;
	  import core.Assets;
	  
	
	/**
	 * ...
	 * @author LuisaGarciaAlva
	 */
	public class Dragon extends MovieClip 
	{
		
		public function Dragon(textures:Vector.<starling.textures.Texture>, fps:Number=12) 
		{
			super(textures, fps);
			
		}
		
		 public function destroy_dragon():void {
  		 this.removeFromParent(true);
  	 }
	}

}