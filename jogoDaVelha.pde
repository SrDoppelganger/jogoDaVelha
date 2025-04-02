int cena; // 0-tela de inicio 1-tela do jogo 2-tela de fim
boolean single; //verifica se o jogo está em singleplayer
String jogador = "Jogador 1";
//importa lógica do jogo
logica logica = new logica();

//variaveis de tema
int[] bgColor = {255, 255, 255};
int[] lineColor = {0, 0, 0};
int[] p1Color = {0 , 0, 255};
int[] p2Color = {255, 0, 0};


void setup(){
  size(600,600);
  background(255);
  inicio();
}

void draw(){
 verificarTabuleiro(); 
  
 if(cena == 1){
   fill(lineColor[0],lineColor[1],lineColor[2]);
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
  background(bgColor[0],bgColor[1],bgColor[2]);
  //linha vertical 1
  strokeWeight(5);
  stroke(lineColor[0],lineColor[1],lineColor[2]);
  line(200,50,200,550);
  
  //linha vertical 2
  line(400,50,400,550);
  
  //linha horizontal 1
  line(50,200,550,200);
  
  //linha horizontal 2
  line(50,400,550,400);
  
}

 void inicio() {
  cena = 0;
  logica.reset();
   
  textSize(56);
  PFont font;
  font = createFont("arial_black.ttf", 56);
  textFont(font, 56);
  strokeWeight(5);
  
  background(bgColor[0],bgColor[1],bgColor[2]);
  fill(lineColor[0],lineColor[1],lineColor[2]);
  textAlign(CENTER);
  text("Jogo da Velha", 300, 200);
  textSize(48);
  fill(p1Color[0],p1Color[1],p1Color[2]);
  text("um jogador", 300, 350);
  fill(p2Color[0],p2Color[1],p2Color[2]);
  text("dois jogadores",300, 450);
  
  }
 
 void empate(){
   cena = 2;
   background(bgColor[0],bgColor[1],bgColor[2]);
   fill(lineColor[0],lineColor[1],lineColor[2]);
   textAlign(CENTER);
   textSize(48);
   text("Empate!",300, height/3);
   textSize(32);
   text("clique para continuar", 300, height / 1.7);
 }
 
 void vitoria(){
   cena = 2;
   
   background(bgColor[0],bgColor[1],bgColor[2]);
   fill(lineColor[0],lineColor[1],lineColor[2]);
   textSize(48);
   textAlign(CENTER);
   if(logica.jogadorDaVez == "X"){
     fill(p1Color[0],p1Color[1],p1Color[2]);
     text("Jogador 1 venceu!",300, height/3);
   }
   else{
     fill(p1Color[0],p1Color[1],p1Color[2]);
     text("Jogador 2 venceu!",300, height/3);
   }
   
   
   textSize(32);
   fill(lineColor[0],lineColor[1],lineColor[2]);
   text("clique para continuar", 300, height / 1.7);
 }
 
 void mouseClicked() {
  if(cena == 0){
    if(mouseX >= 0 && mouseX <= 600 && mouseY >= 280 && mouseY <= 380){
      //modo um jogador
      single = true;
      println("entrando em modo singleplayer");
      
      drawBoard();
      cena = 1;
    }
    if(mouseX >= 0 && mouseX <= 600 && mouseY > 380 && mouseY <= 600){
      //modo dois jogadores
      single = false;
      drawBoard();
      cena = 1;
    }
    
  }
  if(cena == 1){
    //checa tabuleiro antes da próx jogada
    verificarTabuleiro();
    drawJogada();
  }
  if(cena == 2){
    inicio();
  }
 }
 
 void drawJogada(){
  println(mouseX + " " + mouseY);
   
  

   //jogada no quadrado 1,1
   if(mouseX >= 20 && mouseX <= 195 && mouseY >= 20 && mouseY <= 195){
     logica.jogada(0,0,single);
   }
   //jogada no quadrado 1,2
   if(mouseX >= 202 && mouseX <= 398 && mouseY >= 20 && mouseY <= 195){
     logica.jogada(0,1,single);
   }
   //jogada no quadrado 1,3
   if(mouseX >= 403 && mouseX <= 580 && mouseY >= 20 && mouseY <= 195){
     logica.jogada(0,2,single);
   }
    //jogada no quadrado 2,1
   if(mouseX >= 20 && mouseX <= 195 && mouseY >= 202 && mouseY <= 398){
     logica.jogada(1,0,single);
   }
   //jogada no quadrado 2,2
   if(mouseX >= 202 && mouseX <= 398 && mouseY >= 202 && mouseY <= 398){
     logica.jogada(1,1,single);
   }
   //jogada no quadrado 2,3
   if(mouseX >= 403 && mouseX <= 580 && mouseY >= 202 && mouseY <= 398){
     logica.jogada(1,2,single);
   }
    //jogada no quadrado 3,1
   if(mouseX >= 20 && mouseX <= 195 && mouseY >= 403 && mouseY <= 580){
     logica.jogada(2,0,single);
   }
   //jogada no quadrado 3,2
   if(mouseX >= 202 && mouseX <= 398 && mouseY >= 403 && mouseY <= 580){
     logica.jogada(2,1,single);
   }
   //jogada no quadrado 3,3
   if(mouseX >= 403 && mouseX <= 580 && mouseY >= 403 && mouseY <= 580){
     logica.jogada(2,2,single);
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
