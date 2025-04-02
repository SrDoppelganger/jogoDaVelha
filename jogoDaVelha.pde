

void setup(){
  
  size(600,600);
  background(255);
  textSize(56);
  PFont font;
  font = createFont("arial_black.ttf", 56);
  textFont(font, 56);
  strokeWeight(5);
  
  inicio();
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

 void inicio() {
   fill(65, 105, 255);
  text("Jogo da Velha", 80, height / 3);
  text("Iniciar", 200, height / 1.7);
  if (mouseX > 300 && mouseX < 350 && mouseY > 350 && mouseY < 300){
    noFill();
    rect(300, 350, 350, 300);
  }
 }
 
 void mouseClicked() {
 println(mouseX);
 println(mouseY);
 }
