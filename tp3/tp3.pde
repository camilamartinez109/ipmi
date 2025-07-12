//Video:  https://youtu.be/SsLs7oY3Uuk
PImage imagenReferencia;
int cantidadCuadrados = 10;
int cantidadOriginal = 10;
boolean invertirColores = false;
int color1 = 255;            
int color2 = 0;               
boolean usarColoresAleatorios = false;  

boolean movimientoActivo = false;

void setup() {                
  size(800, 400);            
  imagenReferencia = loadImage("img.jpg");
  rectMode(CENTER);
  imageMode(CORNER);
  noLoop(); // para que draw() no se ejecute automáticamente todo el tiempo
}

void draw() {
  background(255);     
  // Imagen referencia    
  if (imagenReferencia != null) {
    image(imagenReferencia, 0, 0, 400, 400);
  } else {
    println("No se pudo cargar la imagen");
  }
  // Dibujo mi versión a la derecha
  dibujarTodosLosBloques(400, 0, 400, 400);     
}

void dibujarTodosLosBloques(float xInicio, float yInicio, float ancho, float alto) { 
  int filas = 2;                                   
  int columnas = 2;                                  
  float anchoCelda = ancho / columnas;                        
  float altoCelda = alto / filas;                        
                                                 
  for (int fila = 0; fila < filas; fila++) {               
    for (int columna = 0; columna < columnas; columna++) {
      float centroX = xInicio + columna * anchoCelda + anchoCelda / 2;
      float centroY = yInicio + fila * altoCelda + altoCelda / 2;

      int direccionX = 0;
      int direccionY = 0;                                                         

      if (columna == 0 && fila == 0) { direccionX = 1; direccionY = -1; }  // arriba izquierda
      if (columna == 1 && fila == 0) { direccionX = 1; direccionY = 1;  }  // arriba derecha
      if (columna == 0 && fila == 1) { direccionX = -1; direccionY = -1; } // abajo izquierda
      if (columna == 1 && fila == 1) { direccionX = -1; direccionY = 1; }  // abajo derecha

      pushMatrix();
      translate(centroX, centroY);                               
      dibujarCuadradosDesplazados(anchoCelda , direccionX, direccionY);              
      popMatrix();
    }
  }
}

void dibujarCuadradosDesplazados(float tamaño, int dx, int dy) {
  float paso = tamaño / cantidadCuadrados;
  float ultimaX = 0;                                   
  float ultimaY = 0;                                  
  float ultimoTamaño = 0;                                

  for (int k = 0; k < cantidadCuadrados; k++) {
    if (usarColoresAleatorios) {
      fill(color(random(255), random(255), random(255)));
    } else {
      if (k % 2 == 0)
        fill(invertirColores ? color2 : color1);
      else
        fill(invertirColores ? color1 : color2);
    }                                                            

    noStroke();
    float tam = tamaño - k * paso;
    float desplazX = dx * k * 3.5;
    float desplazY = dy * k * 3.5;

    rect(desplazX, desplazY, tam, tam);

    if (k == cantidadCuadrados - 2) {
      ultimaX = desplazX;
      ultimaY = desplazY;
      ultimoTamaño = tam;                                         
    }
  }
  // cuadrado negro al centro
  fill(invertirColores ? color1 : color2);
  float tamNegro = ultimoTamaño * 0.7;
  rect(ultimaX, ultimaY, tamNegro, tamNegro);
  // cuadrado blanco al centro
  fill(invertirColores ? color2 : color1);
  float tamBlanco = ultimoTamaño * 0.28;
  rect(ultimaX, ultimaY, tamBlanco, tamBlanco);
}
//Asignacion a cada tecla
void keyPressed() {                             
  if (key == 'c') {                                   
    invertirColores = !invertirColores;
  } else if (key == 'r') {     //Se reinicia(vuelve a sus valor original)
    cantidadCuadrados = cantidadOriginal;
    invertirColores = false;                
    usarColoresAleatorios = false;                 
    color1 = 255;
    color2 = 0;
    movimientoActivo = false;
  } else if (key == '1') {  //Vuelve a su color origial
    usarColoresAleatorios = false;
    color1 = 255;
    color2 = 0;
  } else if (key == '2') {      //Colores aleatorios
    usarColoresAleatorios = true;
  } else if (key == '3') {  // Se invierte el patrón de colores blanco y negro
    usarColoresAleatorios = false;
    color1 = 0;
    color2 = 255;
  }                                                                  
  redraw(); // Fuerza a que draw() se ejecute una vez más, porque use noLoop()
}
//Manejo de movimiento con mouse para modificar cantidad de cuadrados dinámicamente
void mousePressed() {                                     
  movimientoActivo = true;                               
}

void mouseMoved() {
  if (movimientoActivo) {
    cantidadCuadrados = calcularCantidadSegunMouse(mouseX);
    redraw(); // Redibuja al mover el mouse
  }
}

// Función que calcula cuántos cuadrados dibujar según dónde esté el mouse en X
int calcularCantidadSegunMouse(int posX) {
  // Mapea la posición X del mouse (0 a ancho de ventana) a un rango entre 2 y 20
  int resultado = int(map(posX, 0, width, 2, 20));
  // Limita para que no haya menos de 2 ni más de 20 cuadrados
  if (resultado < 2) resultado = 2;
  if (resultado > 20) resultado = 20;
  return resultado;
}
