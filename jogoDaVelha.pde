int cena; // 0-tela de inicio 1-tela do jogo 2-tela de fim
//importa lógica do jogo
logica logica = new logica();

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
 if(cena == 1){
   fill(0);
   textSize(64);
   text(logica.matriz[0][0],110,120);
   text(logica.matriz[0][1],280,120);
   text(logica.matriz[0][2],460,120);
   text(logica.matriz[1][0],110,310);
   text(logica.matriz[1][1],280,310);
   text(logica.matriz[1][2],460,310);
   text(logica.matriz[2][0],120,485);
   text(logica.matriz[2][1],280,485);
   text(logica.matriz[2][2],460,485);
 }
}

void drawBoard(){
  background(255);
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
  cena = 0;
  background(255);
  fill(65, 105, 255);
  text("Jogo da Velha", 80, height / 3);
  text("Iniciar", 200, height / 1.7);
  
  //PQ VC N FUNCIONA???? ( ╥ω╥ )
  if (mouseX > 300 && mouseX < 350 && mouseY > 350 && mouseY < 300){
    noFill();
    rect(300, 350, 350, 300);
  }
 }
 
 void empate(){
   background(255);
   fill(0);
   text("Empate!",80, height/3);
   text("(WIP)", 200, height / 1.7);
 }
 
 void vitoria(){
   background(255);
   fill(0);
   textSize(32);
   textAlign(CENTER);
   text("Algum jogador ganhou!",300, height/3);
   text("(WIP)", 300, height / 1.7);
 }
 
 void mouseClicked() {
  if(cena == 0){
    drawBoard();
    cena = 1;
  }
  if(cena == 1){
    //checa tabuleiro antes da próx jogada
    verificarTabuleiro();
    drawJogada();
  }
  if(cena == 2){
    cena = 0;
    inicio();
  }
 }
 
 void drawJogada(){
  println(mouseX + " " + mouseY);
   
  

   //jogada no quadrado 1,1
   if(mouseX >= 20 && mouseX <= 195 && mouseY >= 20 && mouseY <= 195){
     logica.jogada(0,0);
   }
   //jogada no quadrado 1,2
   if(mouseX >= 202 && mouseX <= 398 && mouseY >= 20 && mouseY <= 195){
     logica.jogada(0,1);
   }
   //jogada no quadrado 1,3
   if(mouseX >= 403 && mouseX <= 580 && mouseY >= 20 && mouseY <= 195){
     logica.jogada(0,2);
   }
    //jogada no quadrado 2,1
   if(mouseX >= 20 && mouseX <= 195 && mouseY >= 202 && mouseY <= 398){
     logica.jogada(1,0);
   }
   //jogada no quadrado 2,2
   if(mouseX >= 202 && mouseX <= 398 && mouseY >= 202 && mouseY <= 398){
     logica.jogada(1,1);
   }
   //jogada no quadrado 2,3
   if(mouseX >= 403 && mouseX <= 580 && mouseY >= 202 && mouseY <= 398){
     logica.jogada(1,2);
   }
    //jogada no quadrado 3,1
   if(mouseX >= 20 && mouseX <= 195 && mouseY >= 403 && mouseY <= 580){
     logica.jogada(2,0);
   }
   //jogada no quadrado 3,2
   if(mouseX >= 202 && mouseX <= 398 && mouseY >= 403 && mouseY <= 580){
     logica.jogada(2,1);
   }
   //jogada no quadrado 3,3
   if(mouseX >= 403 && mouseX <= 580 && mouseY >= 403 && mouseY <= 580){
     logica.jogada(2,2);
   }
 }
 
 void verificarTabuleiro(){
   if(logica.checarResultado()){
     cena = 2;
     vitoria();
   }
   
   if(logica.checarTabuleiro()){
     cena = 2;
     empate();
   }
 }
