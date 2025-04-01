

void setup(){
  
  size(600,600);
  background(255);

  drawBoard();
}

void draw(){

}

void drawBoard(){
  //linha vertical 1
  strokeWeight(5);
  stroke(0);
  line(200,50,200,550);
  
  //linha vertical 2
  strokeWeight(5);
  stroke(0);
  line(400,50,400,550);
  
  //linha horizontal 1
  strokeWeight(5);
  stroke(0);
  line(50,200,550,200);
  
  //linha horizontal 2
  strokeWeight(5);
  stroke(0);
  line(50,400,550,400);
}
