//AmmoManager.as
package managers
{
   import core.GamePool;
   import objects.Food;
   import states.Play;
   import core.Assets;
   
   /**
    * ...
    * @author LuisaGarciaAlva
    */
   public class AmmoManager
   {
  	 private var play:Play;
  	 public var ammo:Array;
	 private var ammoPool:GamePool;
  	 public var fireRate: int = 0;
  	 
  	 public function AmmoManager(play:Play) //usamos un argumento que mande referencia a nuestra clase Play
  	 {
  		 this.play = play;
  		 ammo = new Array();
		  //agregamos una instancia del pool manager
  		 ammoPool = new GamePool(Food, 100); //queremos crear 50 objetos tipo Food
  	 }
  	 
  	 public function update():void {
		 
  		 //variable local para referenciar el láser disparado
  		 var la:Food;
  		 //variable local para referenciar los elementos del array
  		 var len:int = ammo.length;
  		 //un for loop
  		 for (var i:int=len-1; i >= 0; i--) {
  			 //referencia a el láser disparado en el array
  			 la = ammo[i];
  			 //movemos el láser hacia arriba 20 pixels cada ciclo
  			 la.x += 20;
  			 //si el láser ha salido del area de juego, entonces lo destruimos y reciclamos
  			 if (la.y < 0)
  			 //ejecutamos el método destroyFood con parámetro el mismo láser
  			 destroyFood(la);
  			} 
  			 //moderamos el tiempo en que es posible disparar
  		if (play.bool_fire && fireRate % 10 == 0) //usamos el valor de modulus
  		{
			fire();
		}
  			 
		//añadimos un a la valor de fireRate cada ciclo
  		fireRate++;
  		 
  	 }
  	 
  	 private function fire():void {
		 
		    //referenciamos los nuevos objetos del pool manager y
  		 var food:Food = ammoPool.getSprite() as Food;
  		 //agregamos los nuevos objetos al display list, pero con la referencia al estado de juego de Play
  		 play.addChild(food);
  		 //posicionamos el láser a la punta de nuestra nave, asegúrate que la variable ship en Play sea pública
  		 food.x = 200;
  		 //y en el eje Y
  		 food.y = 338;
  		 //agregamos el láser al array, pues ya está en juego
  		 ammo.push(food);
  		 
  	 }
  	 
  	 public function destroyFood(la:Food):void {
  		//variable local para referenciar los elementos del array
  		 var len:int = ammo.length;
  		 //un for loop
  		 for (var i:int = 0; i < len; i++) {
  			 if (ammo[i] == la) {
  			  //quitamos el Food del array
  			  ammo.splice(i, 1);
  			  //eliminamos el Food del display list
  			  //la.removeFromParent(true);
			  la.parent.removeChild(la);
  			  //regresamos el elemento al pool para reutilización posterior
  			  ammoPool.returnSprite(la);
  			 }
  		 } 
  	 }
  	 
//limpiamos los recursos para que se ejecute un cambio de estado de juego eficiente
  	 public function destroy():void {
  		 //destruimos el pool de objetos
  		 ammoPool.destroy();
  		 //aseguremonos de que no quede nada
  		 //adios al pool de objetos
  		 ammoPool = null;
  		 //adios al array
  		 ammo = null;
  	 }
   }

}