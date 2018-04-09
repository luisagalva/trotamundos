//GamePool.as
package core
 {
   import starling.display.DisplayObject;
   
   /**
    * ...
    * @author ...
    */
   public class GamePool
   {
  	 //creamos una variable tipo array que servirá para guardar y administrar los objetos creados
  	 private var pool:Array;
  	 //esta variable numérica servirá para saber cuántos objetos existen
  	 private var counter:int;
  	 
  	 public function GamePool(type:Class, len:int)
  	 {
  		 //creamos el nuevo array
  		 pool = new Array();
  		 //el valor de counter es pasado desde len el argumento en el constructor
  		 counter = len;
  		 
  		 //empezamos la iteracion de objetos
  		 //la variable local i representa el índice de len
  		 var i:int = len;
  		 //simple while que crea los objetos...
  		 //decrementamos en cada iteración el valor de i
  		 while (--i > -1)
  		 //el objeto es creado en el array y se le asigna una clase de acuerdo al tipo especificado (lasers, enemigos, etc.)
  		 pool[i] = new type();
  	 }
  	 
  	 //iniciamos con setters y getters
  	 
  	 //esta función toma el sprite creado
  	 public function getSprite():DisplayObject
  	 {
  		 //si el counter es mayor a 0
  		 if (counter > 0)
  			 //devolvemos un objeto del pool y decrementamos el valor de counter 1 unidad
  			 return pool[--counter];
  		 //si la definición anterior no se cumple
  		 else
  			 //enviamos un mensaje de error a la consola
  			 throw new Error("No hay mas objetos.!");
  	 }
  	 
  	 //esta función regresa el objeto al contenedor de objetos para reutilizarlo
  	 public function returnSprite(s:DisplayObject):void 
//usamos una variable tipo DisplayObject como argumento
  	 {
  		 //regresamos el objeto al contenedor general
  		 pool[counter++] = s;
  	 }
	 
	 //método para limpiar los objetos del pool
  	 public function destroy():void {
  		 //destruimos los objetos
		pool = null;
  	 }
  	 
   }

}