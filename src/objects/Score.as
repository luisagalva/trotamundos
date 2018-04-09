package objects
{
   import starling.display.Sprite;
   import starling.text.TextField;
   
   /**
    * ...
    * @author Luisa Garcia Alva
    */
   public class Score extends Sprite
   {
  	 public  var myScore:TextField;
  	 private var score:int = 0;
	 
  	 public function Score()
  	 { 
		 myScore = new TextField(200, 150, "0");
		 myScore.format.size = 100;
		 myScore.format.color = 0xFFFFFF;
		 myScore.format.font = "myFont";
		 myScore.format.verticalAlign = "center";
		 addChild(myScore);
		myScore.text = "";
		
  	 }
	 
  	   	/* public function hitScore(addScore:int):void {
  		 myScore.text = (parseInt(myScore.text) + addScore).toString();
  	 }*/
	 
  	 public function hitScore(addScore:int):void {
		 score += addScore;
		
		myScore.text = score.toString();
	 }
   
   }
   }