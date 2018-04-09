//EnemyManager.as
package managers
  {
   import core.GamePool;
   import objects.Enemy;
   import starling.core.Starling;
   import starling.display.Sprite;
   import states.Play;
   /**
    * ...
    * @author LuisaGarciaAlva
    */
   public class EnemyManager
   {
  	 private var play:Play;
  	 public var enemy_array:Array;
  	 private var enemyPool:GamePool;
  	 public var countRate:int = 0;
  	 
  	 public function EnemyManager(play:Play) //usamos un argumento que mande referencia a nuestra clase Play
  	 {
  		 this.play = play;
  		 enemy_array = new Array();
  		 //agregamos una instancia del pool manager
  		 enemyPool = new GamePool(Enemy, 50); //queremos crear 50 objetos tipo laser
		 //enemyPool_med = new GamePool(Enemy, 50)
  		 
  	 }
  	 
  	 //esta función permite actualizar las propiedades del láser disparado
  	 public function update():void {
  		 //activaremos spawn cada cierto tiempo, será al azar
  		 if (Math.random() < 0.05) {
  			 spawn();
  		 }
  		 //variable local para referenciar a Enemy
  		 var myEnemy:Enemy;
  		 //variable local para referenciar los elementos del array
  		 var len:int = enemy_array.length;
  		 //un for loop
  		 for (var i:int = len - 1; i >= 0; i--) {
  			 //miremos cual nave corresponde al array
  			 myEnemy = enemy_array[i];
  			 //movemos la nave hacia abajo 6 pixeles cada ciclo
  			 myEnemy.x -= 6;
  			 
  			 //validamos si la nave enemiga salio de la zona de juego
  			 if (myEnemy.x < 0) {
  				 //llamamos el metodo pasando el objeto a reciclar
  				 destroyEnemy(myEnemy);
  			 }
  		 }
  		 

  	 }
  	 
  	 //esta función se encarga de la generación de enemigos
  	 private function spawn():void {
  		 //variable local para referencia al pool de enemigos y hacemos un cast como Enemy
  		 var enemy:Enemy = enemyPool.getSprite() as Enemy;

  		 //pasamos el objeto creado al juggler para que sea animado
  		 Starling.juggler.add(enemy);
		// Starling.juggler.add(enemy_med);
  		 //agregamos el objeto al array
  		 enemy_array.push(enemy);
  		 //posición inicial de las naves enemigas
  		 //primero, en la parte superior, fuera de la vista del jugador
  		 enemy.y = play.stage.stageHeight - 240;
  		 //en el eje X queremos que sea una posicion aleatoria, asi que usamos el metodo random
  		 enemy.x = 700;
  		 //agregamos el objeto al display list de el estado Play
  		 play.addChild(enemy);
  	 }
  	 
  	 //si elenemigo es impactado o sale de la zona de juegohay que quitarlo de la pantalla y regresarlo al object pool
  	 public function destroyEnemy(de:Enemy):void {
  		 //variable local para referenciar los elementos del array
  		 var len:int = enemy_array.length;
  		 //un for loop
  		 for (var i:int = 0; i < len; i++) {
  			 //validamos cual nave debe de ser eliminada y reciclada
  			 if (de == enemy_array[i]) {
  				 //eliminamos del array
  				 enemy_array.splice(i, 1);
  				 //detenemos el juggler y por ende a la animacion
  				 Starling.juggler.remove(de);
  				 //eliminamos del display list
  				 de.removeFromParent(true);
  				 //finalmente lo regresamos al pool para su reutilizacion
  				 enemyPool.returnSprite(de);
  			 }
  		 }
  	 }
  	 
//limpiamos los recursos para que se ejecute un cambio de estado de juego eficiente
  	 public function destroy():void {
  		 //destruimos el pool de objetos
  		 enemyPool.destroy();
  		 //aseguremonos de que no quede nada
  		 //adios al pool de objetos
  		 enemyPool = null;
  		 //adios al array
  		 enemy_array = null;
  	 } 
   }

}