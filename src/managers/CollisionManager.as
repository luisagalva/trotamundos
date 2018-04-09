
package managers
 {
   import core.Game;
   import flash.geom.Point;
   import objects.Enemy;
   import objects.Food;
   import states.Play;
   import objects.Mochilero;
   import core.Assets;
   import objects.Score;
   import starling.text.TextField;
   
   /**
    * ...
    * @author LuisaGarciaAlva
    */
   
   public class CollisionManager
   {
  	 private var play:Play;
	 
  	 //variables para detectar puntos
  	 private var p1:Point = new Point();
  	 private var p2:Point = new Point();
  	 
  	 //variabes para el radio de los objetos
  	 //juega con estos parámetros para ajustar el tamaño del bounding box de los objetos
  	 //área sensible del láser
  	 private var laser_radius:int = 12;
  	 //área sensible de las naves enemigas
  	 private var enemy_radius:int = 12;
  	 //área sensible de nuestra nave
  	 private var mochilero_radius:int = 10;
  	 
  	 //agregamos la referencia a nuestro estado de juego Play
  	 public function CollisionManager(play:Play)
  	 {
  		 //guardamos la referencia en una varible
  		 this.play = play;
	
		 
  	 }
  	 //constantemente revisamos si hay colisiones
  	 public function update():void {
  		 //método que calcula colisiones entre láser y enemigos
  		 shotEnemy();
  		 //método que calcula colisión entre enemigo y nuestra nave
  		
		 
		 
  	 }
  	 
  	 private function shipCrashed():void
  	 {
 //accedemos al manager de enemigos
  		 var em:Array = play.enemy_manager.enemy_array;
  		 var e:Enemy;
  		 //revisamos los enemigos desde arriba de la lista del array
  		 for (var i:int = em.length - 1; i >= 0; i--) {
  			 e = em[i];
  			 //usamos los puntos para ver la distancia entre puntos
  				 //primero vemos la posición de nuestra nave
  				 p1.x = play.mochilero.x;
  				 p1.y = play.mochilero.y;
  				 //ahora de la nave enemiga
  				 p2.x = e.x;
  				 p2.y = e.y;
  			 //validamos la distancia entre puntos
  				 if (Point.distance(p1, p2) < enemy_radius + mochilero_radius) {
  					 //llamamos al estado de juego GAME_OVER de la clase Game
  					 play.game.changeState(Game.GAME_OVER_STATE);
  				 }
  			 
  		 }
  	 }
  	 
  	 private function shotEnemy():void
  	 {
		 
		
  		 //accedemos al manager de lasers
  		 var lm:Array = play.ammo_manager.ammo;
  		 //accedemos al manager de enemigos
  		 var em:Array = play.enemy_manager.enemy_array;
  		 
  		 //variables para encontrar cada objeto de cada array (laser y enemigos)
  		 var la:Food;
  		 var ene:Enemy;
  		 
  		 
  		 //ahora empezamos a validar si existen colisiones usando un for loop
  		 //el primero empieza a hacer el chequeo desde arriba (primeros lasers disparados)
  		 for (var i:int = lm.length - 1; i >= 0; i--) {
			 
  			 //identificamos cada uno de los láseres disparados
  			 la = lm[i];
  			 //checamos si el enemigo
  			 for (var g:int = em.length - 1; g >= 0; g--) {
  				 //identificamos cada una de las naves enemigas
  				 ene = em[g];
  				 //usamos los puntos para ver la distancia entre puntos
  				 //primero vemos la posición del láser
  				 p1.x = la.x;
  				 p1.y = la.y;
  				 //ahora de la nave enemiga
  				 p2.x = ene.x;
  				 p2.y = ene.y;
  				 //validamos la distancia entre puntos
  				 if (Point.distance(p1, p2) < enemy_radius + laser_radius) {
					   					 
			    trace("HOla");
					 
					trace(ene.type_enemy);
					 
					  //sumamos al marcador 100 puntos
  					if (ene.type_enemy == "enemy1.png")
					{
						play.score.hitScore(100);
						
					}
						else
					{
						play.score.hitScore(150);
					}
					  
				
					 
  					 //llamamos los métodos de destrucción de ambos objetos
  					 play.ammo_manager.destroyFood(la);
  					 play.enemy_manager.destroyEnemy(ene);
  				 }
  			 }
  		 }
  	 }
  	 
    }

}