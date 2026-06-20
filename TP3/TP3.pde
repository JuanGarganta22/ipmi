// TP3 op-art
// Enlace al video: https://youtu.be/aQYfjuBIKY0

PImage opArt;
int distV;
int distH;
int cuad;
int esq;
int esq1;
int cuad1;
int esq2;
int cuad2;
int medX;
int medY;
int altAnch;
int colorCuad;
int colorFondo;
int separacion;
float angulo;
float velocidad;
int sentido;
boolean girando;


void setup() {
  size(800, 400);
  opArt = loadImage("29.png");
  image (opArt, 0, 0, 400, 400);
  distV = 16;
  altAnch = 16;
  colorCuad = 0;
  colorFondo = color(255, 255, 0);
  separacion = 0;
  angulo = 0;
  velocidad = 0.02;
  sentido = 1;
}

void draw() {
  println(mouseX, mouseY);
  fill (colorFondo);
  rect(400, 0, 400, 400);
  distH = 18;
  cuad = 8;
  esq = 344;
  esq1 = 350;
  cuad1 = -8;
  esq2 = 608;
  cuad2 = 400;
  medX = 440;
  medY = 1;

  if (girando == true) {

    angulo += velocidad * sentido;

    if (angulo >= radians(2)) {
      sentido = -1;
    }

    if (angulo <= radians(-2)) {
      sentido = 1;
    }
  }
  translate(600, 200); // centro de la obra
  rotate(angulo);
  translate(-600, -200);

  //diagonales que arrancan de arriba
  for (int j = 0; j < 9; j++) {
    esq = esq + 48 ;
    if (esq <= 566  ) {
      for (int i = 0; i < 13; i++) {
        noStroke();
        fill(colorCuad);
        rect(esq+8*i+separacion, -8+cuad*i, altAnch, altAnch);
      }
    } else if (esq > 566 ) {
      for (int i = 0; i < 28; i++) {
        noStroke();
        fill(colorCuad);
        rect(esq+8*i+separacion, -8+cuad*i, altAnch, altAnch);
      }
    }
  }


  //diagonales que arrancan del lado izquierdo
  for (int j = 0; j < 8; j++) {
    cuad1 = cuad1 + 48 ;
    esq1 = 392;
    if (cuad1 < 150 ) {
      for (int i = 0; i < 13; i++) {
        noStroke();
        fill(colorCuad);
        rect(esq1+8*i, cuad1+8*i-separacion, altAnch, altAnch);
      }
    } else if (cuad1 > 150 ) {
      for (int i = 0; i < 30; i++) {
        rect(esq1+8*i, cuad1+8*i-separacion, altAnch, altAnch);
      }
    }
  }

  //diagonales abajo a la derecha
  for (int j = 0; j < 8; j++) {
    esq2 = esq2 + 48 ;
    if (esq2 <= 800 ) {
      for (int i = 0; i < 16; i++) {
        noStroke();
        fill(colorCuad);
        rect(esq2-8*i, cuad2-8*i+separacion, altAnch, altAnch);
      }
    } else if (esq2 > 500 && esq2 < 809 ) {
      for (int i = 0; i < 15; i++) {
        noStroke();
        fill(colorCuad);
        rect(esq2-8*i, cuad2-8*i+separacion, altAnch, altAnch);
      }
    } else if (esq2 == 848 ) {
      for (int i = 0; i < 22; i++) {
        noStroke();
        fill(colorCuad);
        rect(esq2-8*i, cuad2-8*i+separacion, altAnch, altAnch);
      }
    } else if (esq2 == 896 ) {
      for (int i = 0; i < 27; i++) {
        noStroke();
        fill(colorCuad);
        rect(esq2-8*i, cuad2-8*i+separacion, altAnch, altAnch);
      }
    } else if (esq2 == 944 ) {
      for (int i = 0; i < 33; i++) {
        noStroke();
        fill(colorCuad);
        rect(esq2-8*i, cuad2-8*i+separacion, altAnch, altAnch);
      }
    }
  }

  //diagonales del medio (sentido invertido)
  for (int j = 0; j < 8; j++) {
    medX = medX + 48 ;
    medY = medY + 1 ;
    if (medY == 2) {
      for (int i = 0; i < 6; i++) {
        noStroke();
        fill(colorCuad);
        rect(488+8*i, 136-8*i, altAnch, altAnch );
      }
    } else if (medY == 3 ) {
      for (int i = 0; i < 13; i++) {
        rect(488+8*i, 184-8*i, altAnch, altAnch );
      }
    } else if (medY == 4 ) {
      for (int i = 0; i < 18; i++) {
        rect(488+8*i, 232-8*i, altAnch, altAnch );
      }
    } else if (medY == 5 ) {
      for (int i = 0; i < 25; i++) {
        rect(488+8*i, 280-8*i, altAnch, altAnch );
      }
    } else if (medY == 6 ) {
      for (int i = 0; i < 19; i++) {
        rect(536+8*i, 280-8*i, altAnch, altAnch );
      }
    } else if (medY == 7) {
      for (int i = 0; i < 13; i++) {
        rect(584+8*i, 280-8*i, altAnch, altAnch );
      }
    } else if (medY == 8 ) {
      for (int i = 0; i < 6; i++) {
        rect(632+8*i, 280-8*i, altAnch, altAnch );
      }
    }
  }


  //lineas rojas (verticales)
  for (int i = 0; i<500; i++) {
    dibujarLineas(color(255, 0, 0), 400+distV*i, 0, 400+distV*i, 400);
  }

  //lineas grises (horizontales)
  for (int i = 0; i<500; i++) {
    dibujarLineas(180, 400, distV*i, 800, distV*i);
  }
}

//funcion con parametros que no retorna valor
void dibujarLineas(color linea, int x, int y, int x2, int y2) {
  stroke(linea);
  line(x, y, x2, y2);
}

//funcion con parametro que retorna valor
color colorAleatorioOscuro() {
  return color(random(60));
}

//eventos mouse y teclado
void mouseClicked() {                             //  cambio distancia entre lineas
  esq2 = esq2 + 16;
  if (mouseButton == LEFT) {
    distV = distV / 2;
    if ( distV <= 3) {
      distV = 16;
    }
  } else if (mouseButton == RIGHT) {
    distV = distV + 8;
    if (distV >= 80) {
      distV = 16;
    }
  }
};

void keyPressed() {
  if (key == 'c' || key == 'C') {
    colorCuad = colorAleatorioOscuro();                                        //color de los cuadrados
  } else if (key == 'd' || key == 'D') {
    colorFondo = color(random(200, 255), random(200, 255), random(200, 255));  //cambo color fondo 
  } else if (key == 'r' || key == 'R') {                                      // reinicio de variables
    colorCuad = color(0);
    colorFondo = color(255, 255, 0);
    distV = 16;
    altAnch = 16;
    separacion = 0;
    angulo = 0;
  } else if (key == 'g' || key == 'G') {
    girando = !girando;                                                        //movimiento con rotate
  } else if (key == 't' || key == 'T') {                                       //cambio de tamaño de las diagonales 
    separacion = separacion + 2;
    altAnch = altAnch - 2 ;
    if (altAnch == 10) {
      separacion = 0;
      altAnch = 16;
    }
  }
}
