public class logica{
String jogadorDaVez = "X"; 
String[][] matriz = new String[][]{
  {"","",""},
  {"","",""},
  {"","",""}
};

void reset(){
  for(int i=0; i<3;i++){
    for(int j=0; j<3;j++){
      matriz[i][j] = "";
    }
  }
}

void jogada(int li, int col, boolean single){
  checarResultado();
  if(li >= 0 && li < 3 && col >= 0 && col < 3 && matriz[li][col] == ""){
    matriz[li][col] = jogadorDaVez;
    trocarJogador(single);
  }
  else{
    println("Jogada inválida");
    return;
  } 
  if(li>=0 && li < 3 && li>=0 && li <3 && matriz[li][col] == ""){
    matriz[li][col] = jogadorDaVez;
  }
}


void trocarJogador(boolean single){
  checarTabuleiro();
  println("trocando jogador...");
  jogadorDaVez = (jogadorDaVez == "X") ? "O" : "X";
  if(single && jogadorDaVez == "O"){
    jogadaCPU();
  }
}

boolean checarTabuleiro(){
  for(int i = 0; i < 3; i++){
    for(int j = 0; j <3; j++){
      if(matriz[i][j] == ""){
        checarResultado();
        return false;
      }
    }
  }
  
return true;
}

boolean checarResultado(){
  for(int i = 0; i < 3; i++){
    //checa as linhas e as colunas
    if((matriz[i][0] == jogadorDaVez && matriz[i][1] == jogadorDaVez && matriz[i][2] == jogadorDaVez) || (matriz[0][i] == jogadorDaVez && matriz[1][i] == jogadorDaVez && matriz[2][i] == jogadorDaVez)){
      return true;
     
    }
  }
  
  return (matriz[0][0] == jogadorDaVez && matriz[1][1] == jogadorDaVez && matriz[2][2] == jogadorDaVez) ||
         (matriz[0][2] == jogadorDaVez && matriz[1][1] == jogadorDaVez && matriz[2][0] == jogadorDaVez);
}

void jogadaCPU(){
  checarResultado();
  jogadorDaVez = "O";
  ArrayList<int[]> espacosVazios = new ArrayList<int[]>();
  //procura por espaços vazios, e os armazenam na memória
  println(logica.matriz[0][0]);
 for(int i = 0; i<3; i++){
   for(int j = 0; j<3; j++){
     if(logica.matriz[i][j].isEmpty()){
       espacosVazios.add(new int[]{i,j});
     }
   }
 }
 
 if(!espacosVazios.isEmpty()){
   int[] espaco = espacosVazios.get((int)random(espacosVazios.size()));
   jogada(espaco[0],espaco[1],true);
 }
}


}
