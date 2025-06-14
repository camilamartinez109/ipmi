//https://youtu.be/arrbnDdF9JI
PImage img;
int numSquares = 10;
int originalNum = 10;
boolean invertirColores = false;
int color1 = 255;            
int color2 = 0;              
boolean usarColoresRandom = false;    
color[] coloresRandom;

boolean movimientoActivo = false; 

void setup() {                
  size(800, 400);            
  img = loadImage("img.jpg");
  rectMode(CENTER);
  imageMode(CORNER);
  noLoop();
}

void draw() {
  background(255);     
  // Imagen original    
  if (img != null) {
    image(img, 0, 0, 400, 400);
  } else {
    println("No se pudo cargar la imagen");
  }
  // Dibujo generado
  drawAllBlocks(400, 0, 400, 400);     
}

void drawAllBlocks(float offsetX, float offsetY, float w, float h) { 
  int rows =2;                                   
  int cols = 2;                                  
  float cellW = w / cols;                        
  float cellH = h / rows;                        
                                                 
  for (int j = 0; j < rows; j++) {               
    for (int i = 0; i < cols; i++) {
      float cx = offsetX + i * cellW + cellW / 2;
      float cy = offsetY + j * cellH + cellH / 2;

      int dx = 0;
      int dy = 0;                                                         
                                                                          
      if (i == 0 && j == 0) { dx = 1; dy = -1; }  // arriba izquierda
      if (i == 1 && j == 0) { dx = 1; dy = 1;  }  // arriba derecha
      if (i == 0 && j == 1) { dx = -1; dy = -1; } // abajo izquierda
      if (i == 1 && j == 1) { dx = -1; dy = 1; }  // abajo derecha

      pushMatrix();
      translate(cx, cy);                               
      drawShiftedSquares(cellW , dx, dy);              
      popMatrix();
    }
  }
}

void drawShiftedSquares(float size, int dx, int dy) {
  float step = size / numSquares;
  float lastX = 0;                                   
  float lastY = 0;                                  
  float lastS = 0;                                

  for (int k = 0; k < numSquares; k++) {
    if (usarColoresRandom && coloresRandom != null) {
      fill(coloresRandom[k % coloresRandom.length]);
    } else {
      if (k % 2 == 0)
        fill(invertirColores ? color2 : color1);
      else
        fill(invertirColores ? color1 : color2);
    }                                                            

    noStroke();
    float s = size - k * step;
    float shiftX = dx * k * 3.5;
    float shiftY = dy * k * 3.5;

    rect(shiftX, shiftY, s, s);

    if (k == numSquares - 2) {
      lastX = shiftX;
      lastY = shiftY;
      lastS = s;                                         
    }
  }

  fill(invertirColores ? color1 : color2);
  float blackSize = lastS * 0.7;
  rect(lastX, lastY, blackSize, blackSize);

  fill(invertirColores ? color2 : color1);
  float centerSize = lastS * 0.28;
  rect(lastX, lastY, centerSize, centerSize);
}

void keyPressed() {                             
  if (key == 'c') {                                   
    invertirColores = !invertirColores;
  } else if (key == 'r') {
    numSquares = originalNum;
    invertirColores = false;                
    usarColoresRandom = false;                 
    color1 = 255;
    color2 = 0;
    coloresRandom = null;
    movimientoActivo = false;
  } else if (key == '1') {
    usarColoresRandom = false;
    color1 = 255;
    color2 = 0;
  } else if (key == '2') {
    usarColoresRandom = true;
    coloresRandom = new color[numSquares];
    for (int i = 0; i < numSquares; i++) {
      coloresRandom[i] = color(random(255), random(255), random(255));
    }
  } else if (key == '3') {
    usarColoresRandom = false;
    color1 = 0;
    color2 = 255;
  }                                                                  
  redraw();
}

void mousePressed() {                                     
  movimientoActivo = true;                               
}

void mouseMoved() {                                    
  if (movimientoActivo) {                              
    numSquares = int(map(mouseX, 400, width, 2, 20));
    redraw();
  }
}
