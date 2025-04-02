public class logica{
String jogadorDaVez = "X"; 
String[][] matriz = new String[][]{
  {"","",""},
  {"","",""},
  {"","",""}
};

void jogada(int li, int col){
  if(li >= 0 && li < 3 && col >= 0 && col < 3 && matriz[li][col] == ""){
    matriz[li][col] = jogadorDaVez;
    println(matriz[li][col]);
    trocarJogador();
  }
  else{
    println("Jogada inválida");
    return;
  } 
}


void trocarJogador(){
  jogadorDaVez = (jogadorDaVez == "X") ? "O" : "X";
}

}
