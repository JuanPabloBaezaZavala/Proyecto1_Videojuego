//OCRAExtended-48
//VARIABLES GLOBALES
import ddf.minim.*;
PFont titulo, titulo2, menu, select, creditos, movimientos;
int pantalla = 0;
int jugador1;
int jugador2;
int ronda = 1;
int turno = 0;
int barra1 = 100;
int barra2 = 100;
float dt;

//audio
Minim musicas;
AudioPlayer musica_fondo1;
AudioPlayer musica_fondo2;
AudioPlayer musica_fondo3;

//PERSONAJES MENU
Alfred     Zar1;
V          Hug1;
Verdugo    Mat1;
Hechicera  Cla1;
Arquitecto Arm1;

//PERSONAJES PARA FIGHT IZQ
Alfred     Zar2;
V          Hug2;
Verdugo    Mat2;
Hechicera  Cla2;
Arquitecto Arm2;
//PERSONAJES PARA FIGHT DER
Alfred     Zar3;
V          Hug3;
Verdugo    Mat3;
Hechicera  Cla3;
Arquitecto Arm3;

//Bolsa de materiales
void setup() {
  size (900, 600);
  //sele personaje
  titulo = loadFont ("AgencyFB-Bold-48.vlw");
  titulo2 = loadFont ("OCRAExtended-48.vlw");
  menu = loadFont ("OCRAExtended-48.vlw");
  select = loadFont ("Bauhaus93-48.vlw");
  creditos = loadFont ("Arial-BoldMT-48.vlw");
  movimientos = loadFont ("TwCenMT-Bold-20.vlw");

  //Audio Menu
  musicas = new Minim(this);
  musica_fondo1 = musicas.loadFile("juego_pantalla menu.mp3");
  musica_fondo1.setGain(-10);
  musica_fondo1.loop();
  //Audio Fight
    musicas = new Minim(this);
  musica_fondo2 = musicas.loadFile("juego_pantalla fight.mp3");
  musica_fondo2.setGain(-20);
  musica_fondo2.loop();
  //Audio Resolucion
  musicas = new Minim(this);
  musica_fondo3 = musicas.loadFile("juego_pantalla resolucion.mp3");
  musica_fondo3.setGain(-10);
  musica_fondo3.loop();
  
  //PERSONAJES SELECCION DE PERSONAJE
  Zar1 = new Alfred(100, 110);
  Hug1 = new V(380, 100);
  Mat1 = new Verdugo(650, 110);
  Cla1 = new Hechicera(200, 310);
  Arm1 = new Arquitecto(510, 280);

  //PELEA FIGHT MADAFAKA1 IZQ
  Zar2 = new Alfred(150, 400);
  Hug2 = new V(150, 390);
  Mat2 = new Verdugo(150, 400);
  Cla2 = new Hechicera(150, 400);
  Arm2 = new Arquitecto(150, 370);
  //2  DER
  Zar3 = new Alfred(750, 400);
  Hug3 = new V(750, 390);
  Mat3 = new Verdugo(750, 400);
  Cla3 = new Hechicera(750, 400);
  Arm3 = new Arquitecto(750, 370);
}
//bolsa de impresiones
void draw() {
  background (30, 30, 30);
  switch (pantalla) {

  case 0:
    pushMatrix();
    musica_fondo1.pause();
    musica_fondo2.pause();
    musica_fondo3.pause();
    fill(53, 53, 53);
    noStroke();
    rect(220, 130, 450, 100, 43);
    textFont (titulo);
    textSize (90);
    fill(255, 0, 0);
    text ("DIS IS FIGHT", 270, 215);
    textFont (titulo2);
    textSize(30);
    fill(random(255), random(255), random(255));
    text ("Presiona 'SPACIO' para continuar", 160, 500);
    if (keyCode == 32) {
      pantalla = 1;
      musica_fondo1.loop();
    }

    popMatrix();

    break;
    //CASO SELECCION DE PERSONAJE
  case 1: 
    menu();

    break;

    //PANTALLA DE PELEA YEAH
  case 2:
    fight();
    //MOVIMIENTO DE PERSONAJES
    if (keyPressed) {
      switch(key) {
        //Movimiento persoanjes de Der
      case 'w':
        Zar2.desplace(0);
        Hug2.desplace(0);
        Mat2.desplace(0);
        Cla2.desplace(0);
        Arm2.desplace(0);
        break;
      case 'a':
        Zar2.desplace(2);
        Hug2.desplace(2);
        Mat2.desplace(2);
        Cla2.desplace(2);
        Arm2.desplace(2);
        break;
      case 's':
        Zar2.desplace(3);
        Hug2.desplace(3);
        Mat2.desplace(3);
        Cla2.desplace(3);
        Arm2.desplace(3);
        break;
      case 'd':
        Zar2.desplace(1);
        Hug2.desplace(1);
        Mat2.desplace(1);
        Cla2.desplace(1);
        Arm2.desplace(1);
        break;
        //Movimiento persoanjes de Izq
      case 'o':
        Zar3.desplace(0);
        Hug3.desplace(0);
        Mat3.desplace(0);
        Cla3.desplace(0);
        Arm3.desplace(0);
        break;
      case 'k':
        Zar3.desplace(2);
        Hug3.desplace(2);
        Mat3.desplace(2);
        Cla3.desplace(2);
        Arm3.desplace(2);
        break;
      case 'l':
        Zar3.desplace(3);
        Hug3.desplace(3);
        Mat3.desplace(3);
        Cla3.desplace(3);
        Arm3.desplace(3);
        break;
      case 'ñ':
        Zar3.desplace(1);
        Hug3.desplace(1);
        Mat3.desplace(1);
        Cla3.desplace(1);
        Arm3.desplace(1);
        break;
      }
    }
    
    //ATAQUES DE JUGADOR 1
    keyPressed();
    switch(key) {
      //ATAQUES DE JUGADOR 1
    case 'q':
      if ((key == 'q' || key == 'Q')&&(turno == 0)) {
        barra2 -= 5;
        turno = 1;
      }
      break;
    case 'e':
      if ((key == 'e' || key == 'E')&&(turno == 0)) {
        barra2 -= 10;
        turno = 1;
      }
      break;

      //ATAQUES DE JUGADOR 2
    case 'i':
      if ((key == 'i' || key == 'I')&&(turno == 1)) {
        barra1 -= 5;
        turno = 0;
      }
      break;
    case 'p':
      if ((key == 'p' || key == 'P')&&(turno == 1)) {
        barra1 -= 10;
        turno = 0;
      }
      break;
    }
    //DIBUJAR PERSONAJES PARA FIGHT IZQ/DER
    if (jugador1 == 1) {
      Zar2.display();
      Zar2.limites();
      fill(200, 200, 200);
      noStroke();
      textFont (titulo2);
      textSize (30);
      text ("Alfred", 200, 75);
    }
    if (jugador2 == 1) {
      Zar3.display2();
      Zar3.limites2();
      fill(200, 200, 200);
      noStroke();
      textFont (titulo2);
      textSize (30);
      text ("Alfred", 600, 75);
    }
    if (jugador1 == 2) {
      Hug2.display();
      Hug2.limites();
      fill(200, 200, 200);
      noStroke();
      textFont (titulo2);
      textSize (30);
      text ("V", 230, 75);
    }
    if (jugador2 == 2) {
      Hug3.display2();
      Hug3.limites2();
      fill(200, 200, 200);
      noStroke();
      textFont (titulo2);
      textSize (30);
      text ("V", 640, 75);
    }
    if (jugador1 == 3) {
      Mat2.display();
      Mat2.limites();
      fill(200, 200, 200);
      noStroke();
      textFont (titulo2);
      textSize (30);
      text ("Verdugo", 200, 75);
    }
    if (jugador2 == 3) {
      Mat3.display2();
      Mat3.limites2();
      fill(200, 200, 200);
      noStroke();
      textFont (titulo2);
      textSize (30);
      text ("Verdugo", 600, 75);
    }
    if (jugador1 == 4) {
      Cla2.display();
      Cla2.limites();
      fill(200, 200, 200);
      noStroke();
      textFont (titulo2);
      textSize (30);
      text ("Hechicera", 180, 75);
    }
    if (jugador2 == 4) {
      Cla3.display2();
      Cla3.limites2();
      fill(200, 200, 200);
      noStroke();
      textFont (titulo2);
      textSize (30);
      text ("Hechicera", 580, 75);
    }
    if (jugador1 == 5) {
      Arm2.display();
      Arm2.limites();
      fill(200, 200, 200);
      noStroke();
      textFont (titulo2);
      textSize (30);
      text ("Arquitecto", 170, 75);
    }
    if (jugador2 == 5) {
      Arm3.display2();
      Arm3.limites2();
      fill(200, 200, 200);
      noStroke();
      textFont (titulo2);
      textSize (30);
      text ("Arquitecto", 570, 75);
    }

    if (barra1 <= 0 || barra2 <= 0) {
      pantalla = 3;
      musica_fondo3.loop();
    }

    break;


    //ULTIMA PANTALLA
  case 3:
    resolucion();
    if (keyCode == 10) {
      pantalla = 1;
      ronda = 1;
      barra1 = 100;
      barra2 = 100;
      musica_fondo3.pause();
    }
  }
}
//BOLSAS DE MESPECIFICAIONES DE MENU Y PANTALLA DE PELEA
//bOLSA DE MENU
void menu() {
  //background de menu
  dt+=0.01;
  background(100, 35, 50);
  noStroke();
  for (int i= 0; i<width; i+=8) {
    for (int j = 0; j<height; j+=8) {
      fill(noise(i*0.05+dt, j*0.05, dt)*0, noise(i*0.05+dt+1, dt)*255);
      rect(i, j, 8, 8);
    }
  }
  textSize(6);
  fill(random(255), random(255), random(255));
  noStroke();
  textFont(menu);
  text ("SELECCIONA TU CANDIDATO", 110, 550);

  Zar1.display();
  Hug1.display();
  Mat1.display();
  Cla1.display();
  Arm1.display();

  //LETRAS CORRESPONDIENTES A PERSONAJE
  textSize (130);
  textFont (select);
  fill(198, 233, 180);
  text ("F", 140, 310);
  text ("G", 430, 310);
  text ("H", 710, 310);
  text ("V", 250, 510);
  text ("B", 580, 510);

  //BOTONES PARA SELECCION DE PERONAJES
  keyPressed();
  switch (key) {
  case 'f':
    if ((key == 'f' || key == 'F')&&(ronda == 1)) {
      jugador1 =1;
      ronda = 2;
    } else { 
      if ((key == 'f' || key == 'F')&&(ronda == 2)&& jugador1!=1) {
        jugador2 = 1;
        pantalla = 2;
        musica_fondo1.pause();
        musica_fondo2.loop();
      }
    } 

  case 'g':
    if ((key == 'g' || key == 'G')&&(ronda == 1)) {
      jugador1 = 2;
      ronda = 2;
    } else { 
      if ((key == 'g' || key == 'G')&&(ronda == 2)&& jugador1!=2) {
        jugador2 = 2;
        pantalla = 2;
        musica_fondo1.pause();
        musica_fondo2.loop();
      }
    }

  case 'h':
    if ((key == 'h' || key == 'H')&&(ronda == 1)) {
      jugador1 = 3;
      ronda = 2;
    } else { 
      if ((key == 'h' || key == 'H')&&(ronda == 2)&& jugador1!=3) {
        jugador2 = 3;
        pantalla = 2;
        musica_fondo1.pause();
        musica_fondo2.loop();
      }
    } 

  case 'v':
    if ((key == 'v' || key == 'V')&&(ronda == 1)) {
      jugador1 = 4;
      ronda = 2;
    } else { 
      if ((key == 'v' || key == 'V')&&(ronda == 2)&& jugador1!=4) {
        jugador2 = 4;
        pantalla = 2;
        musica_fondo1.pause();
        musica_fondo2.loop();
      }
    }

  case 'b':
    if ((key == 'b' || key == 'B')&&(ronda == 1)) {
      jugador1 = 5;
      ronda = 2;
    } else { 
      if ((key == 'b' || key == 'B')&&(ronda == 2)&& jugador1!=5) {
        jugador2 = 5;
        pantalla = 2;
        musica_fondo1.pause();
        musica_fondo2.loop();
      }
    }
  }
}
//BOLSA DE PANTALLA DE PELEA
void fight() {
  dt +=0.01;
  //nubes
  background(20, 110, 250);
  noStroke();
  for (int i = 0; i<width; i+=5) {
    for (int j = 0; j<height; j+=5) {
      fill(noise(i*0.05+dt, j*0.05, dt) *0, noise(i*0.05+dt *1, j*0.05+1, dt) *255);
      rect(i, j, 10, 10);
    }
  }


  //piso
  fill(13, 37, 16);
  noStroke();
  rect(0, 400, 900, 600);
  //fondo atras
  fill(3, 6, 10);
  noStroke();
  rect(10, 260, 70, 150);
  //fondo
  fill(9, 13, 26);
  noStroke();
  rect(50, 120, 70, 300);
  rect(40, 110, 90, 10);
  rect(60, 100, 50, 10);
  rect(70, 90, 30, 10);
  rect(80, 80, 10, 10);
  //seg edificio fondo
  rect(450, 120, 70, 300);
  rect(440, 110, 90, 10);
  rect(460, 100, 50, 10);
  rect(470, 90, 30, 10);
  rect(480, 80, 10, 10);


  //BARRAS DE VIDA

  fill(50, 250, 50);
  noStroke();
  rect(100, 80, barra1*3, 20);
  rect(500, 80, barra2*3, 20);

  //BOTONES PARA FIGHT
  pushMatrix();
  fill(100, 100, 255);
  noStroke();
  ellipse (/*posicion*/100, 150, /*tamaño*/30, 30);
  ellipse (/*posicion*/60, 185, /*tamaño*/30, 30);
  ellipse (/*posicion*/140, 185, /*tamaño*/30, 30);
  ellipse (/*posicion*/100, 220, /*tamaño*/30, 30);
  ellipse (/*posicion*/800, 150, /*tamaño*/30, 30);
  ellipse (/*posicion*/760, 185, /*tamaño*/30, 30);
  ellipse (/*posicion*/840, 185, /*tamaño*/30, 30);
  ellipse (/*posicion*/800, 220, /*tamaño*/30, 30);
  fill(100, 255, 100);
  noStroke();
  ellipse (/*posicion*/180, 185, /*tamaño*/30, 30);
  ellipse (/*posicion*/720, 185, /*tamaño*/30, 30);
  fill(255, 100, 100);
  noStroke();
  ellipse (/*posicion*/210, 220, /*tamaño*/30, 30);
  ellipse (/*posicion*/690, 220, /*tamaño*/30, 30);
  popMatrix();

  //LETRAS CORRESPONDIENTES A BOTONES
  pushMatrix();
  textFont (movimientos);
  fill(8, 3, 10);
  text ("W", 95, 155);
  text ("A", 55, 190);
  text ("D", 135, 190);
  text ("S", 95, 225);
  text ("Q", 175, 190);
  text ("E", 205, 225);
  text ("O", 795, 155);
  text ("K", 755, 190);
  text ("Ñ", 835, 190);
  text ("L", 795, 225);
  text ("I", 715, 190);
  text ("P", 685, 225);
  popMatrix();
}


//PANTALLA DE GANADOR!!!!
void resolucion() {
  if ((barra1 <= 0)&&(jugador2 == 1)) {
    musica_fondo2.pause();
    fill(255);
    textFont(titulo2);
    textSize(30);
    text("(Alfred)",370,220);
    textFont(creditos);
    textSize(60);
    text("Jugador 2", 300, 170);
    fill(random(255), random(255), random(255));
    textFont(titulo2);
    textSize(70);
    text("ERES EL GANADOR", 150, 350);
    fill(random(255), random(255));
    textFont(creditos);
    textSize(20);
    text("Presiona 'ENTER' para siguiente pelea", 270, 550);
  } else if ((barra2 <= 0)&&(jugador1 == 1)) {
    musica_fondo2.pause();
    fill(255);
    textFont(titulo2);
    textSize(30);
    text("(Alfred)",370,220);
    textFont(creditos);
    textSize(60);
    text("Jugador 1", 300, 170);
    fill(random(255), random(255), random(255));
    textFont(titulo2);
    textSize(70);
    text("ERES EL GANADOR", 150, 350);
    fill(random(255), random(255));
    textFont(creditos);
    textSize(20);
    text("Presiona 'ENTER' para siguiente pelea", 270, 550);
  }
  
  if ((barra1 <= 0)&&(jugador2 == 2)) {
    musica_fondo2.pause();
    fill(255);
    textFont(titulo2);
    textSize(30);
    text("(V)",410,220);
    textFont(creditos);
    textSize(60);
    text("Jugador 2", 300, 170);
    fill(random(255), random(255), random(255));
    textFont(titulo2);
    textSize(70);
    text("ERES EL GANADOR", 150, 350);
    fill(random(255), random(255));
    textFont(creditos);
    textSize(20);
    text("Presiona 'ENTER' para siguiente pelea", 270, 550);
  } else if ((barra2 <= 0)&&(jugador1 == 2)) {
    musica_fondo2.pause();
    fill(255);
    textFont(titulo2);
    textSize(30);
    text("(V)",410,220);
    textFont(creditos);
    textSize(60);
    text("Jugador 1", 300, 170);
    fill(random(255), random(255), random(255));
    textFont(titulo2);
    textSize(70);
    text("ERES EL GANADOR", 150, 350);
    fill(random(255), random(255));
    textFont(creditos);
    textSize(20);
    text("Presiona 'ENTER' para siguiente pelea", 270, 550);
  }
  
  if ((barra1 <= 0)&&(jugador2 == 3)) {
    musica_fondo2.pause();
    fill(255);
    textFont(titulo2);
    textSize(30);
    text("(Verdugo)",370,220);
    textFont(creditos);
    textSize(60);
    text("Jugador 2", 300, 170);
    fill(random(255), random(255), random(255));
    textFont(titulo2);
    textSize(70);
    text("ERES EL GANADOR", 150, 350);
    fill(random(255), random(255));
    textFont(creditos);
    textSize(20);
    text("Presiona 'ENTER' para siguiente pelea", 270, 550);
  } else if ((barra2 <= 0)&&(jugador1 == 3)) {
    musica_fondo2.pause();
    fill(255);
    textFont(titulo2);
    textSize(30);
    text("(Verdugo)",370,220);
    textFont(creditos);
    textSize(60);
    text("Jugador 1", 300, 170);
    fill(random(255), random(255), random(255));
    textFont(titulo2);
    textSize(70);
    text("ERES EL GANADOR", 150, 350);
    fill(random(255), random(255));
    textFont(creditos);
    textSize(20);
    text("Presiona 'ENTER' para siguiente pelea", 270, 550);
  }
  
  if ((barra1 <= 0)&&(jugador2 == 4)) {
    musica_fondo2.pause();
    fill(255);
    textFont(titulo2);
    textSize(30);
    text("(Hechicera)",350,220);
    textFont(creditos);
    textSize(60);
    text("Jugador 2", 300, 170);
    fill(random(255), random(255), random(255));
    textFont(titulo2);
    textSize(70);
    text("ERES EL GANADOR", 150, 350);
    fill(random(255), random(255));
    textFont(creditos);
    textSize(20);
    text("Presiona 'ENTER' para siguiente pelea", 270, 550);
  } else if ((barra2 <= 0)&&(jugador1 == 4)) {
    musica_fondo2.pause();
    fill(255);
    textFont(titulo2);
    textSize(30);
    text("(Hechicera)",350,220);
    textFont(creditos);
    textSize(60);
    text("Jugador 1", 300, 170);
    fill(random(255), random(255), random(255));
    textFont(titulo2);
    textSize(70);
    text("ERES EL GANADOR", 150, 350);
    fill(random(255), random(255));
    textFont(creditos);
    textSize(20);
    text("Presiona 'ENTER' para siguiente pelea", 270, 550);
  }
  
  if ((barra1 <= 0)&&(jugador2 == 5)) {
    musica_fondo2.pause();
    fill(255);
    textFont(titulo2);
    textSize(30);
    text("(Arquitecto)",340,220);
    textFont(creditos);
    textSize(60);
    text("Jugador 2", 300, 170);
    fill(random(255), random(255), random(255));
    textFont(titulo2);
    textSize(70);
    text("ERES EL GANADOR", 150, 350);
    fill(random(255), random(255));
    textFont(creditos);
    textSize(20);
    text("Presiona 'ENTER' para siguiente pelea", 270, 550);
  } else if ((barra2 <= 0)&&(jugador1 == 5)) {
    musica_fondo2.pause();
    fill(255);
    textFont(titulo2);
    textSize(30);
    text("(Arquitecto)",340,220);
    textFont(creditos);
    textSize(60);
    text("Jugador 1", 300, 170);
    fill(random(255), random(255), random(255));
    textFont(titulo2);
    textSize(70);
    text("ERES EL GANADOR", 150, 350);
    fill(random(255), random(255));
    textFont(creditos);
    textSize(20);
    text("Presiona 'ENTER' para siguiente pelea", 270, 550);
  }

  if (keyCode == 10) {
    pantalla = 1;
    barra1 = 100;
    barra2 = 100;
    Zar2 = new Alfred(150, 400);
    Zar3 = new Alfred(750, 400);
    Hug2 = new V(150, 390);
    Hug3 = new V(750, 390);
    Mat2 = new Verdugo(150, 400);
    Mat3 = new Verdugo(750, 400);
    Cla2 = new Hechicera(150, 400);
    Cla3 = new Hechicera(750, 400);
    Arm2 = new Arquitecto(150, 370);
    Arm3 = new Arquitecto(750, 370);
    musica_fondo1.play();
  }
}

/*DISEÑO DE CODIGO DE PERSONAJES TOMADO DE VIDEO DE YOU TUBE, URL:
 */

//atributos
class Alfred {
  int x;
  int y;
  int t;
  float v;

  //metodos
  Alfred(int x_, int y_) {
    x = x_;
    y = y_;
    this.t = 10;
    this.v = 10;
  }

  void desplace(int m_) {
    switch(m_) {
    case 0:
      this.y -= this.v;
      break;
    case 1:
      this.x += this.v;
      break;
    case 2:
      this.x -= this.v;
      break;
    case 3:
      this.y += this.v;
      break;
    }
  }
  void limites() {
    this.x = constrain(this.x, 0, 340-this.t);
    this.y = constrain(this.y, 320, 445-this.t);
  }

  void display() {
    //CAMISA
    pushMatrix();
    translate(x, y);
    scale(0.39, 0.39);
    fill (51, 51, 60);
    noStroke();
    /*parte alta*/    rect(t*9, t*-1, t*12, t*3);
    rect(t*5, t*1, t*21, t*3);
    /*parte media*/
    rect(t*8, t*3, t*13, t*12);
    rect(t*21, t*9, t*2, t*6);
    /*brazo izq*/
    rect(t*3, t*2, t*4, t*13);
    rect(t*6, t*3, t*4, t*4);
    /*brazo derecho*/
    rect(t*24, t*2, t*4, t*13);
    rect(t*21, t*3, t*3, t*4);

    //PIERNAS
    fill (22, 15, 10);
    noStroke();
    rect(t*14, t*15, t*4, t*9);
    /*izq*/    rect(t*9, t*15, t*5, t*22);
    rect(t*8, t*15, t*2, t*9);
    /*der*/    rect(t*18, t*15, t*5, t*22);

    //PIES
    fill (0, 0, 0);
    noStroke();
    rect(t*9, t*37, t*5, t*3);
    rect(t*9, t*38, t*8, t*3);
    rect(t*18, t*37, t*5, t*3);
    rect(t*18, t*38, t*8, t*3);

    /*cinto*/
    fill (0, 0, 0);
    noStroke();
    rect(t*8, t*15, t*4, t*1);
    rect(t*14, t*15, t*3, t*1);
    rect(t*20, t*15, t*3, t*1);
    //PARTES DE PIEL
    fill (192, 160, 134);
    noStroke();
    //manos
    /*izq*/    rect(t*3, t*15, t*3, t*3);
    /*der*/    rect(t*25, t*15, t*3, t*3);

    //cara
    rect(t*12, t*-7, t*5, t*8);
    rect(t*17, t*-7, t*3, t*6);
    rect(t*12, t*-9, t*2, t*2);
    /*ojos*/
    fill (63, 26, 1);
    noStroke();
    ellipse(t*18, t*-6, t*1, t*1);
    /*cabello*/
    fill (0, 0, 0);
    noStroke();
    rect(t*14, t*-9, t*6, t*2);
    rect(t*12, t*-7, t*2, t*5);

    popMatrix();
  }



  //PERSONAJES PARA SEGUNDO PLAYER VOLTEADOS

  void limites2() {
    this.x = constrain(this.x, 580, 900-this.t);
    this.y = constrain(this.y, 320, 445-this.t);
  }

  void display2() {
    //CAMISA
    pushMatrix();
    translate(x, y);
    scale(-0.39, 0.39);
    fill (51, 51, 60);
    noStroke();
    /*parte alta*/    rect(t*9, t*-1, t*12, t*3);
    rect(t*5, t*1, t*21, t*3);
    /*parte media*/
    rect(t*8, t*3, t*13, t*12);
    rect(t*21, t*9, t*2, t*6);
    /*brazo izq*/
    rect(t*3, t*2, t*4, t*13);
    rect(t*6, t*3, t*4, t*4);
    /*brazo derecho*/
    rect(t*24, t*2, t*4, t*13);
    rect(t*21, t*3, t*3, t*4);

    //PIERNAS
    fill (22, 15, 10);
    noStroke();
    rect(t*14, t*15, t*4, t*9);
    /*izq*/    rect(t*9, t*15, t*5, t*22);
    rect(t*8, t*15, t*2, t*9);
    /*der*/    rect(t*18, t*15, t*5, t*22);

    //PIES
    fill (0, 0, 0);
    noStroke();
    rect(t*9, t*37, t*5, t*3);
    rect(t*9, t*38, t*8, t*3);
    rect(t*18, t*37, t*5, t*3);
    rect(t*18, t*38, t*8, t*3);

    /*cinto*/
    fill (0, 0, 0);
    noStroke();
    rect(t*8, t*15, t*4, t*1);
    rect(t*14, t*15, t*3, t*1);
    rect(t*20, t*15, t*3, t*1);
    //PARTES DE PIEL
    fill (192, 160, 134);
    noStroke();
    //manos
    /*izq*/    rect(t*3, t*15, t*3, t*3);
    /*der*/    rect(t*25, t*15, t*3, t*3);

    //cara
    rect(t*12, t*-7, t*5, t*8);
    rect(t*17, t*-7, t*3, t*6);
    rect(t*12, t*-9, t*2, t*2);
    /*ojos*/
    fill (63, 26, 1);
    noStroke();
    ellipse(t*18, t*-6, t*1, t*1);
    /*cabello*/
    fill (0, 0, 0);
    noStroke();
    rect(t*14, t*-9, t*6, t*2);
    rect(t*12, t*-7, t*2, t*5);

    popMatrix();
  }
}



//atributos
class V {
  int x;
  int y;
  int t;
  float v;

  //metodos
  V(int x_, int y_) {
    x = x_;
    y = y_;
    this.t = 10;
    this.v = 10;
  }

  void desplace(int m_) {
    switch(m_) {
    case 0:
      this.y -= this.v;
      break;
    case 1:
      this.x += this.v;
      break;
    case 2:
      this.x -= this.v;
      break;
    case 3:
      this.y += this.v;
      break;
    }
  }

  void limites() {
    this.x = constrain(this.x, 0, 340-this.t);
    this.y = constrain(this.y, 320, 430-this.t);
  }

  void display() {
    pushMatrix();
    translate(x, y);
    scale(0.4, 0.4);
    //CAMISA
    fill (10, 89, 120);
    noStroke();
    /*parte alta*/    rect(t*2, t*1, t*27, t*5);
    /*parte media*/
    rect(t*9, t*3, t*13, t*9);
    rect(t*11, t*11, t*9, t*3);
    /*brazo izq*/
    rect(t*2, t*3, t*4, t*13);
    rect(t*4, t*5, t*4, t*4);
    /*brazo derecho*/
    rect(t*25, t*3, t*4, t*13);
    rect(t*23, t*5, t*3, t*4);

    /*cuello de capa*/
    fill (46, 51, 30);
    noStroke();
    /*hombro izq*/
    rect(t*12, t*-1, t*2, t*3);
    rect(t*2, t*1, t*5, t*3);
    rect(t*7, t*1, t*7, t*1);
    /*hombro der*/
    rect(t*24, t*1, t*5, t*3);
    rect(t*17, t*0, t*2, t*2);
    rect(t*18, t*1, t*7, t*1);

    //PIERNAS
    fill (13, 12, 20);
    noStroke();
    rect(t*14, t*14, t*3, t*10);
    /*izq*/    rect(t*9, t*12, t*2, t*28);
    rect(t*11, t*14, t*2, t*26);
    rect(t*13, t*14, t*1, t*16);
    /*der*/    rect(t*20, t*12, t*2, t*28);
    rect(t*18, t*14, t*2, t*26);
    rect(t*17, t*14, t*1, t*16);

    //PIES
    fill (45, 25, 11);
    noStroke();
    rect(t*9, t*40, t*7, t*3);
    rect(t*11, t*38, t*2, t*3);
    rect(t*18, t*40, t*7, t*3);
    rect(t*20, t*38, t*2, t*3);

    //PARTES DE PIEL
    fill (237, 193, 164);
    noStroke();
    //manos
    /*izq*/    rect(t*2, t*16, t*3, t*3);
    /*der*/    rect(t*26, t*16, t*3, t*3);

    //cara
    fill (237, 193, 164);
    noStroke();
    rect(t*14, t*-7, t*3, t*8);
    rect(t*17, t*-7, t*1, t*7);
    rect(t*18, t*-7, t*2, t*6);
    rect(t*12, t*-4, t*2, t*2);
    /*ojos*/
    fill (63, 26, 1);
    noStroke();
    rect(t*18, t*-6, t*1, t*1);
    /*cabello*/
    fill (0, 0, 0);
    noStroke();
    rect(t*12, t*-9, t*8, t*2);
    rect(t*12, t*-7, t*3, t*3);
    /*barba*/
    fill (66, 31, 20);
    noStroke();
    rect(t*17, t*-4, t*3, t*1);
    rect(t*16, t*-3, t*1, t*2);
    rect(t*16, t*-2, t*4, t*2);

    popMatrix();
  }



  //PERSONAJES PARA SEGUNDO PLAYER VOLTEADOS
  void limites2() {
    this.x = constrain(this.x, 580, 900-this.t);
    this.y = constrain(this.y, 320, 430-this.t);
  }

  void display2() {
    pushMatrix();
    translate(x, y);
    scale(-0.4, 0.4);
    //CAMISA
    fill (10, 89, 120);
    noStroke();
    /*parte alta*/    rect(t*2, t*1, t*27, t*5);
    /*parte media*/
    rect(t*9, t*3, t*13, t*9);
    rect(t*11, t*11, t*9, t*3);
    /*brazo izq*/
    rect(t*2, t*3, t*4, t*13);
    rect(t*4, t*5, t*4, t*4);
    /*brazo derecho*/
    rect(t*25, t*3, t*4, t*13);
    rect(t*23, t*5, t*3, t*4);

    /*cuello de capa*/
    fill (46, 51, 30);
    noStroke();
    /*hombro izq*/
    rect(t*12, t*-1, t*2, t*3);
    rect(t*2, t*1, t*5, t*3);
    rect(t*7, t*1, t*7, t*1);
    /*hombro der*/
    rect(t*24, t*1, t*5, t*3);
    rect(t*17, t*0, t*2, t*2);
    rect(t*18, t*1, t*7, t*1);

    //PIERNAS
    fill (13, 12, 20);
    noStroke();
    rect(t*14, t*14, t*3, t*10);
    /*izq*/    rect(t*9, t*12, t*2, t*28);
    rect(t*11, t*14, t*2, t*26);
    rect(t*13, t*14, t*1, t*16);
    /*der*/    rect(t*20, t*12, t*2, t*28);
    rect(t*18, t*14, t*2, t*26);
    rect(t*17, t*14, t*1, t*16);

    //PIES
    fill (45, 25, 11);
    noStroke();
    rect(t*9, t*40, t*7, t*3);
    rect(t*11, t*38, t*2, t*3);
    rect(t*18, t*40, t*7, t*3);
    rect(t*20, t*38, t*2, t*3);

    //PARTES DE PIEL
    fill (237, 193, 164);
    noStroke();
    //manos
    /*izq*/    rect(t*2, t*16, t*3, t*3);
    /*der*/    rect(t*26, t*16, t*3, t*3);

    //cara
    fill (237, 193, 164);
    noStroke();
    rect(t*14, t*-7, t*3, t*8);
    rect(t*17, t*-7, t*1, t*7);
    rect(t*18, t*-7, t*2, t*6);
    rect(t*12, t*-4, t*2, t*2);
    /*ojos*/
    fill (63, 26, 1);
    noStroke();
    rect(t*18, t*-6, t*1, t*1);
    /*cabello*/
    fill (0, 0, 0);
    noStroke();
    rect(t*12, t*-9, t*8, t*2);
    rect(t*12, t*-7, t*3, t*3);
    /*barba*/
    fill (66, 31, 20);
    noStroke();
    rect(t*17, t*-4, t*3, t*1);
    rect(t*16, t*-3, t*1, t*2);
    rect(t*16, t*-2, t*4, t*2);

    popMatrix();
  }
}



//atributos
class Verdugo {
  int x;
  int y;
  int t;
  float v;

  //metodos
  Verdugo(int x_, int y_) {
    x = x_;
    y = y_;
    this.t = 10;
    this.v = 10;
  }

  void desplace(int m_) {
    switch(m_) {
    case 0:
      this.y -= this.v;
      break;
    case 1:
      this.x += this.v;
      break;
    case 2:
      this.x -= this.v;
      break;
    case 3:
      this.y += this.v;
      break;
    }
  }

  void limites() {
    this.x = constrain(this.x, 0, 340-this.t);
    this.y = constrain(this.y, 320, 445-this.t);
  }

  void display() {
    pushMatrix();
    translate(x, y);
    scale(0.5, 0.5);
    //CAPA
    fill (19, 35, 100);
    noStroke();
    rect(t*7, t*28, t*16, t*3);
    rect(t*8, t*21, t*14, t*8);
    /*parte media*/    rect(t*9, t*7, t*11, t*6);
    rect(t*10, t*12, t*9, t*5);
    rect(t*9, t*17, t*12, t*4);
    /*brazo izq*/
    rect(t*5, t*6, t*4, t*3);
    rect(t*4, t*7, t*4, t*3);
    rect(t*2, t*9, t*1, t*3);
    rect(t*3, t*8, t*4, t*5);
    rect(t*4, t*11, t*4, t*3);
    rect(t*6, t*12, t*3, t*3);
    rect(t*8, t*13, t*3, t*3);
    /*brazo derecho*/
    rect(t*19, t*6, t*2, t*2);
    rect(t*19, t*7, t*3, t*3);
    rect(t*20, t*9, t*3, t*5);
    rect(t*21, t*11, t*3, t*3);
    rect(t*22, t*12, t*3, t*3);
    /*parte alta*/    rect(t*6, t*5, t*14, t*2);
    rect(t*11, t*0, t*6, t*5);
    rect(t*12, t*-2, t*9, t*2);
    rect(t*13, t*-3, t*7, t*1);
    rect(t*14, t*-4, t*5, t*1);
    rect(t*15, t*-5, t*3, t*1);
    rect(t*20, t*0, t*1, t*1);
    rect(t*14, t*-4, t*5, t*1);
    rect(t*8, t*3, t*3, t*3);
    //Detalles
    /*base de capa*/
    fill (10, 25, 90);
    noStroke();
    /*base*/    rect(t*5, t*30, t*18, t*2);
    rect(t*20, t*0, t*1, t*1);
    rect(t*17, t*4, t*1, t*1);

    //Guitarra
    fill (102, 24, 26);
    noStroke();
    rect(t*23, t*16, t*1, t*1);
    rect(t*20, t*10, t*1, t*1);
    rect(t*20, t*17, t*2, t*3);
    rect(t*21, t*16, t*2, t*3);
    rect(t*19, t*10, t*1, t*3);
    rect(t*19, t*17, t*1, t*4);
    rect(t*17, t*9, t*2, t*13);
    rect(t*14, t*8, t*3, t*14);
    rect(t*12, t*9, t*4, t*14);   
    rect(t*10, t*9, t*2, t*10);
    rect(t*8, t*10, t*2, t*7);
    rect(t*6, t*12, t*2, t*5);
    rect(t*5, t*15, t*2, t*2);
    rect(t*10, t*21, t*2, t*2);
    rect(t*11, t*20, t*1, t*3);
    //detalles
    fill (135, 47, 8);
    noStroke();
    rect(t*11, t*10, t*7, t*7);
    rect(t*13, t*13, t*6, t*7);

    //parte amarilla
    fill (239, 175, 34);
    noStroke();
    rect(t*12, t*14, t*3, t*4);
    rect(t*14, t*14, t*2, t*3);
    rect(t*15, t*13, t*4, t*3);
    rect(t*18, t*12, t*4, t*3);
    rect(t*21, t*11, t*4, t*3);
    rect(t*24, t*10, t*4, t*3);
    rect(t*27, t*9, t*4, t*3);
    //punta
    fill (81, 36, 36);
    noStroke();
    rect(t*29, t*7, t*4, t*4);


    //PARTES DE PIEL
    fill (181, 128, 80);
    noStroke();
    //manos
    /*der*/    rect(t*24, t*13, t*2, t*2);
    /*izq*/    rect(t*10, t*14, t*3, t*3);

    //cara
    fill (181, 128, 80);
    noStroke();
    rect(t*15, t*0, t*2, t*5);
    rect(t*17, t*0, t*3, t*4);
    /*ojos*/
    fill (0, 0, 0);
    noStroke();
    ellipse(t*18, t*1, t*1, t*1);

    fill (19, 35, 100);
    noStroke();
    //MANO IZQ DE CAPA
    rect(t*3, t*8, t*4, t*5);
    rect(t*4, t*11, t*4, t*3);
    rect(t*6, t*12, t*3, t*3);
    rect(t*8, t*13, t*3, t*3);

    popMatrix();
  }



  //PERSONAJES PARA SEGUNDO PLAYER VOLTEADOS
  void limites2() {
    this.x = constrain(this.x, 580, 900-this.t);
    this.y = constrain(this.y, 320, 445-this.t);
  }

  void display2() {
    pushMatrix();
    translate(x, y);
    scale(-0.5, 0.5);
    //CAPA
    fill (19, 35, 100);
    noStroke();
    rect(t*7, t*28, t*16, t*3);
    rect(t*8, t*21, t*14, t*8);
    /*parte media*/    rect(t*9, t*7, t*11, t*6);
    rect(t*10, t*12, t*9, t*5);
    rect(t*9, t*17, t*12, t*4);
    /*brazo izq*/
    rect(t*5, t*6, t*4, t*3);
    rect(t*4, t*7, t*4, t*3);
    rect(t*2, t*9, t*1, t*3);
    rect(t*3, t*8, t*4, t*5);
    rect(t*4, t*11, t*4, t*3);
    rect(t*6, t*12, t*3, t*3);
    rect(t*8, t*13, t*3, t*3);
    /*brazo derecho*/
    rect(t*19, t*6, t*2, t*2);
    rect(t*19, t*7, t*3, t*3);
    rect(t*20, t*9, t*3, t*5);
    rect(t*21, t*11, t*3, t*3);
    rect(t*22, t*12, t*3, t*3);
    /*parte alta*/    rect(t*6, t*5, t*14, t*2);
    rect(t*11, t*0, t*6, t*5);
    rect(t*12, t*-2, t*9, t*2);
    rect(t*13, t*-3, t*7, t*1);
    rect(t*14, t*-4, t*5, t*1);
    rect(t*15, t*-5, t*3, t*1);
    rect(t*20, t*0, t*1, t*1);
    rect(t*14, t*-4, t*5, t*1);
    rect(t*8, t*3, t*3, t*3);
    //Detalles
    /*base de capa*/
    fill (10, 25, 90);
    noStroke();
    /*base*/    rect(t*5, t*30, t*18, t*2);
    rect(t*20, t*0, t*1, t*1);
    rect(t*17, t*4, t*1, t*1);

    //Guitarra
    fill (102, 24, 26);
    noStroke();
    rect(t*23, t*16, t*1, t*1);
    rect(t*20, t*10, t*1, t*1);
    rect(t*20, t*17, t*2, t*3);
    rect(t*21, t*16, t*2, t*3);
    rect(t*19, t*10, t*1, t*3);
    rect(t*19, t*17, t*1, t*4);
    rect(t*17, t*9, t*2, t*13);
    rect(t*14, t*8, t*3, t*14);
    rect(t*12, t*9, t*4, t*14);   
    rect(t*10, t*9, t*2, t*10);
    rect(t*8, t*10, t*2, t*7);
    rect(t*6, t*12, t*2, t*5);
    rect(t*5, t*15, t*2, t*2);
    rect(t*10, t*21, t*2, t*2);
    rect(t*11, t*20, t*1, t*3);
    //detalles
    fill (135, 47, 8);
    noStroke();
    rect(t*11, t*10, t*7, t*7);
    rect(t*13, t*13, t*6, t*7);

    //parte amarilla
    fill (239, 175, 34);
    noStroke();
    rect(t*12, t*14, t*3, t*4);
    rect(t*14, t*14, t*2, t*3);
    rect(t*15, t*13, t*4, t*3);
    rect(t*18, t*12, t*4, t*3);
    rect(t*21, t*11, t*4, t*3);
    rect(t*24, t*10, t*4, t*3);
    rect(t*27, t*9, t*4, t*3);
    //punta
    fill (81, 36, 36);
    noStroke();
    rect(t*29, t*7, t*4, t*4);


    //PARTES DE PIEL
    fill (181, 128, 80);
    noStroke();
    //manos
    /*der*/    rect(t*24, t*13, t*2, t*2);
    /*izq*/    rect(t*10, t*14, t*3, t*3);

    //cara
    fill (181, 128, 80);
    noStroke();
    rect(t*15, t*0, t*2, t*5);
    rect(t*17, t*0, t*3, t*4);
    /*ojos*/
    fill (0, 0, 0);
    noStroke();
    ellipse(t*18, t*1, t*1, t*1);

    fill (19, 35, 100);
    noStroke();
    //MANO IZQ DE CAPA
    rect(t*3, t*8, t*4, t*5);
    rect(t*4, t*11, t*4, t*3);
    rect(t*6, t*12, t*3, t*3);
    rect(t*8, t*13, t*3, t*3);

    popMatrix();
  }
}



//atributos
class Hechicera {
  int x;
  int y;
  int t;
  float v;

  //metodos
  Hechicera(int x_, int y_) {
    x = x_;
    y = y_;
    this.t = 10;
    this.v =10;
  }

  void desplace(int m_) {
    switch(m_) {
    case 0:
      this.y -= this.v;
      break;
    case 1:
      this.x += this.v;
      break;
    case 2:
      this.x -= this.v;
      break;
    case 3:
      this.y += this.v;
      break;
    }
  }

  void limites() {
    this.x = constrain(this.x, 0, 340-this.t);
    this.y = constrain(this.y, 325, 445-this.t);
  }

  void display() {
    pushMatrix();
    translate(x, y);
    scale(0.5, 0.5);
    //CAPA
    fill (0, 193, 156);
    noStroke();
    rect(t*7, t*28, t*15, t*3);
    rect(t*8, t*23, t*13, t*5);
    rect(t*9, t*18, t*11, t*5);
    /*parte media*/
    rect(t*10, t*7, t*9, t*5);
    rect(t*11, t*12, t*7, t*6);
    /*brazo izq*/
    rect(t*8, t*6, t*2, t*2);
    rect(t*7, t*7, t*3, t*8);
    /*brazo derecho*/
    rect(t*19, t*6, t*2, t*2);
    rect(t*19, t*7, t*3, t*3);
    rect(t*20, t*8, t*3, t*3);
    rect(t*21, t*9, t*3, t*3);
    rect(t*22, t*10, t*3, t*3);
    rect(t*23, t*11, t*3, t*3);
    rect(t*25, t*11, t*1, t*4);
    rect(t*26, t*10, t*1, t*6);
    rect(t*27, t*10, t*2, t*7);

    /*parte alta*/    rect(t*9, t*5, t*11, t*2);
    rect(t*11, t*0, t*6, t*5);
    rect(t*12, t*-2, t*9, t*2);
    rect(t*13, t*-3, t*7, t*1);
    rect(t*14, t*-4, t*5, t*1);
    rect(t*15, t*-5, t*3, t*1);
    rect(t*20, t*0, t*1, t*1);
    rect(t*14, t*-4, t*5, t*1);
    rect(t*10, t*2, t*1, t*3);

    //Detalles
    /*base de capa*/
    fill (116, 226, 176);
    noStroke();
    /*base*/    rect(t*5, t*30, t*18, t*2);
    rect(t*28, t*10, t*2, t*8);
    rect(t*7, t*14, t*3, t*1);
    rect(t*14, t*-1, t*7, t*1);
    rect(t*14, t*-1, t*1, t*6);
    rect(t*11, t*7, t*7, t*1);
    rect(t*12, t*8, t*5, t*1);
    rect(t*13, t*9, t*3, t*1);
    rect(t*14, t*10, t*1, t*1);
    fill (36, 86, 96);
    noStroke();
    rect(t*20, t*0, t*1, t*1);
    rect(t*17, t*4, t*1, t*1);

    //PARTES DE PIEL
    fill (226, 218, 199);
    noStroke();
    //manos
    /*der*/    rect(t*30, t*10, t*2, t*2);
    /*izq*/    rect(t*7, t*15, t*2, t*2);

    //cara
    fill (226, 218, 199);
    noStroke();
    rect(t*15, t*0, t*2, t*5);
    rect(t*17, t*0, t*1, t*4);
    rect(t*18, t*0, t*1, t*3);
    rect(t*19, t*0, t*1, t*2);
    /*ojos*/
    fill (50, 100, 200);
    noStroke();
    ellipse(t*18, t*1, t*1, t*1);

    //BARITA
    fill (73, 36, 8);
    noStroke();
    rect(t*31, t*10, t*1, t*1);
    rect(t*32, t*9, t*1, t*1);
    rect(t*33, t*8, t*1, t*1);
    rect(t*34, t*7, t*1, t*1);
    rect(t*35, t*6, t*1, t*1);

    popMatrix();
  }



  //PERSONAJES PARA SEGUNDO PLAYER VOLTEADOS
  void limites2() {
    this.x = constrain(this.x, 580, 900-this.t);
    this.y = constrain(this.y, 325, 445-this.t);
  }

  void display2() {
    pushMatrix();
    translate(x, y);
    scale(-0.5, 0.5);
    //CAPA
    fill (0, 193, 156);
    noStroke();
    rect(t*7, t*28, t*15, t*3);
    rect(t*8, t*23, t*13, t*5);
    rect(t*9, t*18, t*11, t*5);
    /*parte media*/
    rect(t*10, t*7, t*9, t*5);
    rect(t*11, t*12, t*7, t*6);
    /*brazo izq*/
    rect(t*8, t*6, t*2, t*2);
    rect(t*7, t*7, t*3, t*8);
    /*brazo derecho*/
    rect(t*19, t*6, t*2, t*2);
    rect(t*19, t*7, t*3, t*3);
    rect(t*20, t*8, t*3, t*3);
    rect(t*21, t*9, t*3, t*3);
    rect(t*22, t*10, t*3, t*3);
    rect(t*23, t*11, t*3, t*3);
    rect(t*25, t*11, t*1, t*4);
    rect(t*26, t*10, t*1, t*6);
    rect(t*27, t*10, t*2, t*7);

    /*parte alta*/    rect(t*9, t*5, t*11, t*2);
    rect(t*11, t*0, t*6, t*5);
    rect(t*12, t*-2, t*9, t*2);
    rect(t*13, t*-3, t*7, t*1);
    rect(t*14, t*-4, t*5, t*1);
    rect(t*15, t*-5, t*3, t*1);
    rect(t*20, t*0, t*1, t*1);
    rect(t*14, t*-4, t*5, t*1);
    rect(t*10, t*2, t*1, t*3);

    //Detalles
    /*base de capa*/
    fill (116, 226, 176);
    noStroke();
    /*base*/    rect(t*5, t*30, t*18, t*2);
    rect(t*28, t*10, t*2, t*8);
    rect(t*7, t*14, t*3, t*1);
    rect(t*14, t*-1, t*7, t*1);
    rect(t*14, t*-1, t*1, t*6);
    rect(t*11, t*7, t*7, t*1);
    rect(t*12, t*8, t*5, t*1);
    rect(t*13, t*9, t*3, t*1);
    rect(t*14, t*10, t*1, t*1);
    fill (36, 86, 96);
    noStroke();
    rect(t*20, t*0, t*1, t*1);
    rect(t*17, t*4, t*1, t*1);

    //PARTES DE PIEL
    fill (226, 218, 199);
    noStroke();
    //manos
    /*der*/    rect(t*30, t*10, t*2, t*2);
    /*izq*/    rect(t*7, t*15, t*2, t*2);

    //cara
    fill (226, 218, 199);
    noStroke();
    rect(t*15, t*0, t*2, t*5);
    rect(t*17, t*0, t*1, t*4);
    rect(t*18, t*0, t*1, t*3);
    rect(t*19, t*0, t*1, t*2);
    /*ojos*/
    fill (50, 100, 200);
    noStroke();
    ellipse(t*18, t*1, t*1, t*1);

    //BARITA
    fill (73, 36, 8);
    noStroke();
    rect(t*31, t*10, t*1, t*1);
    rect(t*32, t*9, t*1, t*1);
    rect(t*33, t*8, t*1, t*1);
    rect(t*34, t*7, t*1, t*1);
    rect(t*35, t*6, t*1, t*1);

    popMatrix();
  }
}



//atributos
class Arquitecto {
  int x;
  int y;
  int t;
  float v;

  //metodos
  Arquitecto(int x_, int y_) {
    x = x_;
    y = y_;
    this.t = 10;
    this.v =10;
  }

  void desplace(int m_) {
    switch(m_) {
    case 0:
      this.y -= this.v;
      break;
    case 1:
      this.x += this.v;
      break;
    case 2:
      this.x -= this.v;
      break;
    case 3:
      this.y += this.v;
      break;
    }
  }

  void limites() {
    this.x = constrain(this.x, 0, 340-this.t);
    this.y = constrain(this.y, 300, 410-this.t);
  }

  void display() {
    pushMatrix();
    translate(x, y);
    scale(0.5, 0.5);
    //CAPA
    fill (34, 23, 58);
    noStroke();
    /*parte alta*/    rect(t*8, t*3, t*16, t*3);
    rect(t*11, t*1, t*10, t*2);
    /*parte media*/
    rect(t*11, t*6, t*9, t*7);
    /*brazo izq*/
    rect(t*10, t*2, t*2, t*2);
    rect(t*7, t*4, t*3, t*11);
    /*brazo derecho*/
    rect(t*20, t*2, t*2, t*2);
    rect(t*21, t*4, t*3, t*11);

    //Detalles
    /*cinta de cintua*/
    fill (60, 21, 31);
    noStroke();
    rect(t*11, t*12, t*9, t*2);
    /*cuello de capa*/
    fill (16, 6, 21);
    noStroke();
    rect(t*12, t*3, t*7, t*2);
    //Base de capa
    fill (25, 13, 30);
    noStroke();
    rect(t*11, t*14, t*9, t*4);
    rect(t*10, t*16, t*10, t*2);
    rect(t*9, t*18, t*11, t*2);
    rect(t*8, t*20, t*12, t*2);
    rect(t*7, t*22, t*13, t*2);
    rect(t*6, t*24, t*9, t*1);
    rect(t*5, t*25, t*5, t*1);
    //PIERNAS
    fill (16, 6, 21);
    noStroke();
    rect(t*11, t*25, t*3, t*12);
    rect(t*17, t*24, t*3, t*13);
    //PIES
    fill (40, 11, 21);
    noStroke();
    rect(t*11, t*37, t*3, t*2);
    rect(t*14, t*38, t*2, t*1);
    rect(t*17, t*37, t*3, t*2);
    rect(t*20, t*38, t*2, t*1);

    //PARTES DE PIEL
    fill (214, 214, 159);
    noStroke();
    //manos
    /*der*/    rect(t*22, t*15, t*2, t*2);
    /*izq*/    rect(t*7, t*15, t*2, t*2);

    //cara
    fill (214, 214, 159);
    noStroke();
    rect(t*14, t*-2, t*2, t*6);
    rect(t*16, t*-2, t*3, t*4);
    rect(t*13, t*-3, t*1, t*1);
    /*ojos*/
    fill (115, 10, 20);
    noStroke();
    ellipse(t*17, t*-1, t*1, t*1);
    /*cabello*/
    fill (0, 0, 0);
    noStroke();
    rect(t*14, t*-3, t*5, t*1);
    rect(t*13, t*-4, t*6, t*1);
    rect(t*13, t*-2, t*1, t*4);

    popMatrix();
  }



  //PERSONAJES PARA SEGUNDO PLAYER VOLTEADOS
  void limites2() {
    this.x = constrain(this.x, 580, 900-this.t);
    this.y = constrain(this.y, 300, 410-this.t);
  }

  void display2() {
    pushMatrix();
    translate(x, y);
    scale(-0.5, 0.5);
    //CAPA
    fill (34, 23, 58);
    noStroke();
    /*parte alta*/    rect(t*8, t*3, t*16, t*3);
    rect(t*11, t*1, t*10, t*2);
    /*parte media*/
    rect(t*11, t*6, t*9, t*7);
    /*brazo izq*/
    rect(t*10, t*2, t*2, t*2);
    rect(t*7, t*4, t*3, t*11);
    /*brazo derecho*/
    rect(t*20, t*2, t*2, t*2);
    rect(t*21, t*4, t*3, t*11);

    //Detalles
    /*cinta de cintua*/
    fill (60, 21, 31);
    noStroke();
    rect(t*11, t*12, t*9, t*2);
    /*cuello de capa*/
    fill (16, 6, 21);
    noStroke();
    rect(t*12, t*3, t*7, t*2);
    //Base de capa
    fill (25, 13, 30);
    noStroke();
    rect(t*11, t*14, t*9, t*4);
    rect(t*10, t*16, t*10, t*2);
    rect(t*9, t*18, t*11, t*2);
    rect(t*8, t*20, t*12, t*2);
    rect(t*7, t*22, t*13, t*2);
    rect(t*6, t*24, t*9, t*1);
    rect(t*5, t*25, t*5, t*1);
    //PIERNAS
    fill (16, 6, 21);
    noStroke();
    rect(t*11, t*25, t*3, t*12);
    rect(t*17, t*24, t*3, t*13);
    //PIES
    fill (40, 11, 21);
    noStroke();
    rect(t*11, t*37, t*3, t*2);
    rect(t*14, t*38, t*2, t*1);
    rect(t*17, t*37, t*3, t*2);
    rect(t*20, t*38, t*2, t*1);

    //PARTES DE PIEL
    fill (214, 214, 159);
    noStroke();
    //manos
    /*der*/    rect(t*22, t*15, t*2, t*2);
    /*izq*/    rect(t*7, t*15, t*2, t*2);

    //cara
    fill (214, 214, 159);
    noStroke();
    rect(t*14, t*-2, t*2, t*6);
    rect(t*16, t*-2, t*3, t*4);
    rect(t*13, t*-3, t*1, t*1);
    /*ojos*/
    fill (115, 10, 20);
    noStroke();
    ellipse(t*17, t*-1, t*1, t*1);
    /*cabello*/
    fill (0, 0, 0);
    noStroke();
    rect(t*14, t*-3, t*5, t*1);
    rect(t*13, t*-4, t*6, t*1);
    rect(t*13, t*-2, t*1, t*4);

    popMatrix();
  }
}  
