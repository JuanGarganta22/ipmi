int segundos;
int vel;
int posX;
int posY;
int opacidad;
int tiempoInicio = 0;

PImage pantalla1;
PImage pantalla2;
PImage pantalla3;
PImage pantalla4;
PImage pantalla5;
PImage pantalla6;

String mensaje1 = "Hola yo soy el profesor Oak y te voy a dar la bievenida en el mundo Pokemon.";
String mensaje2 = "Esta es la isla donde conviven las personas con sus mejores amigos los pokemones. Aca vas a poder capturar y entrenar a tus pokemones para que esten listos para la batalla.";
String mensaje3 = "Tu casa esta en pueblo paleta y esta es tu habitacion. Aca es donde vas a poder descansar y recuperar energia para afrontar las nuevas aventuras.";
String mensaje4 = "Es la hora de tu primer batalla. Tu rival va a jugar con su golem asi que vos elegis a bulbasaur que es un gran pokemon para luchar contra los tipo roca.";
String mensaje5 = "Utilizas los ataques de hoja afilada y bomba germen para derrotar a tu oponente.";

PFont fuente;

void setup(){
  background(255);
  size( 640, 480);
  pantalla1 = loadImage("Pantalla1.PNG");
  pantalla2 = loadImage("Pantalla2.PNG");
  pantalla3 = loadImage("Pantalla3.PNG");
  pantalla4 = loadImage("Pantalla4.PNG");
  pantalla5 = loadImage("Pantalla5.PNG");
  pantalla6 = loadImage("pantalla6.png");
  frameRate(60);
  vel = 1;
  posX = -300;
  posY = 485;
  opacidad = 0;
  fill(255);
  fuente = loadFont("SegoeUIBlack-48.vlw");
  textFont(fuente);
  textSize(20);
};

void draw(){
  segundos = (millis() - tiempoInicio)/1000;
  println(segundos);
  println(mouseX , mouseY);
  noStroke();
  
  if( segundos < 10){      //pantalla1
  image(pantalla1, 0, 0, 640, 480);
  fill(255);
  rect(24, 324, 576, 127, 15);
  fill(0);
  text (mensaje1, posX, 340, 570, 120);
  if(posX < 30){
  posX = posX+5;
  }
  }
  
  else if ( segundos >= 10 && segundos<20){          //pantalla 2
  image(pantalla2, 0, 0, 640, 480);
  fill(255);
  rect(28, 274, 570, 185, 15);
  fill(0);
  textSize(28);
  text(mensaje2, 35, posY, 570, 500);
  if(posY>280){
  posY = posY-3;
  }
  }
  
  else if ( segundos >= 20 && segundos<30){        //pantalla 3
  image(pantalla3, 0, 0, 640, 480);
  textSize(20);
  fill(255, 255, 255, opacidad);
  rect(30, 350, 570, 110, 15);
  fill(0, 0, 0, opacidad);
  text(mensaje3, 35, 365, 550, 470);
  posY = 485; // reinicio la psicion en Y aca para usar esta variable en la siguiente pantalla
  if(segundos < 45 && opacidad < 255){
  opacidad = opacidad + 5;
  }
  }
  
  else if ( segundos >= 30 && segundos < 40){        //pantalla 4
  image(pantalla4, 0, 0, 640, 480);
  posX = -300; // vuelvo a asignarle valor a posX para usarla en la proxima pantalla
  fill(255);
  rect(25, 338, 587, 112, 15);
  fill(0);
  text(mensaje4, 35, posY, 600, 440);
  if(posY>350){
  posY = posY-3;
  }
  }
  
  else if ( segundos >= 40 && segundos < 50){        //pantalla 5
  image(pantalla5, 0, 0, 640, 480);
  fill(255);
  rect(21, 360, 598, 100, 15);
  fill(0);
  text (mensaje5, posX, 375, 570, 125);
  if(posX < 30){
  posX = posX+5;
  }
  }
  else if ( segundos > 50 ){
    image(pantalla6, 0, 0, 640, 480);
    fill(255);
    rect(15, 362, 395,97);
    rect(431, 362, 195, 97);
    fill(0);
    textSize(20);
    text("felicidades! Lograste ganar tu primer batalla. Para que el profesor Oak te haga nuevamente el recorrido hace click en reiniciar.", 20, 367, 390, 475);
    textSize(34);
    text("REINICIAR", 440, 422);
  }
  };
  
 void mousePressed(){

if(segundos > 50){

if(mouseX > 431 && mouseX < 626 && mouseY > 362 && mouseY < 459){
  tiempoInicio = millis();
  posX = -300;
  posY = 485;
  opacidad = 0;
  textSize(24);
}
}
};
