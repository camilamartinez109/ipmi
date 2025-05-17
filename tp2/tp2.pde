
PImage img1, img2, img3, img4, img5; //Variables
PFont fuente; //Variable para fuente
int tiempoCambio = 480; //Cambia cada 8 segundos
int diapositiva = 0;
float y;
boolean mostrarBoton = false;  // Controla si se muestra el botón de reiniciar

void setup() {
  size(640, 480);
  background(0);
 y = height;

  //configuracion del texto
  textSize(25);
  textAlign( CENTER, CENTER);
  fuente = loadFont("CalisMTBol-35.vlw");
  textFont(fuente);
  
  img1 =loadImage("img1.jpg");
  img2 =loadImage("img2.jpg");
  img3 =loadImage("img3.jpg");
  img4 =loadImage("img4.jpg");
  img5 =loadImage("img5.jpg");
}

 void draw() {
   background(0);
   
    if (mostrarBoton) {
    fill(255);
    text("Fin del recorrido de Sonic", width / 2, height / 2 - 60);

    fill(100, 200, 255);
    rect(width / 2 - 75, height / 2 - 20, 150, 50, 10);

    fill(0);
    text("Reiniciar", width / 2, height / 2 + 5);

    return;  // No dibujar nada más mientras mostramos el b
    }
   //Cambiar de diapositiva cada ciertos segundos
   if (frameCount % tiempoCambio == 0) {
     if (diapositiva < 4) {
     diapositiva++;
     y = height; // Reiniciamos la posicion del texto
     }
   
     if (diapositiva > 4) {
        diapositiva = 0;
     }
   }
   //Mostrar imagen correspondiente
   if (diapositiva == 0) image(img1, 0, 0, width, height);
   if (diapositiva == 1) image(img2, 0, 0, width, height);
   if (diapositiva == 2) image(img3, 0, 0, width, height);
   if (diapositiva == 3) image(img4, 0, 0, width, height);
   if (diapositiva == 4) image(img5, 0, 0, width, height);
    
   // Mostrar el texto en movimiento
   fill(255); // Color de la letra(Blanco)
   if (diapositiva == 0) {
   text("Sonic ya esta listo...", width / 2, y);
   text("su mision: salvar el", width / 2, y + 60);
   text("mundo una vez mas", width / 2, y + 120);
   }else if (diapositiva == 1) {
   text("La carrera comenzo", width / 2, y);
   text("Sonic corre a toda velocidad esquivando", width / 2, y + 60);
   text("enemigos y recolectando anillos dorados", width / 2, y + 120);
   }else if (diapositiva == 2){
   text("Pero sonic no esta solo, amigos", width / 2, y);
   text("enemigos y rivales aparecen en su", width / 2, y + 60);
   text("camino.Cada paso, una nueva batalla", width / 2, y + 120);
   }else if (diapositiva == 3) {
   text("Sonic se enfrenta al peligro sin dudar", width / 2, y);
   text("¡El dr. Eggman ataca con", width / 2, y + 60);
   text("todo lo que tiene!", width / 2, y + 120);
   }else if (diapositiva == 4) {
    text("Con la esmeralda en sus manos", width / 2, y);
    text("y el viento a su favor,", width / 2, y + 60); 
    text("Sonic vuelve a ganar!", width / 2, y + 120); 
    
     // Cuando el texto termine de subir, muestra el botón
  if (y + 120 < 0) {
    mostrarBoton = true;
  }
   }
   //Movimiento hacia arriba
   y -= 0.8;
   
   // Si el texto sale de la pantalla, reiniciar posición (solo si no está el botón)
  if (y + 120 < 0 && !mostrarBoton && diapositiva < 4) {
    y = height;
  }
 }
   // Botón para reiniciar
void mousePressed() {
  if (mostrarBoton) {
    if (mouseX > width / 2 - 75 && mouseX < width / 2 + 75 &&
        mouseY > height / 2 - 20 && mouseY < height / 2 + 30) {
      diapositiva = 0;
      y = height;
      mostrarBoton = false;
   }
  }
}
  
