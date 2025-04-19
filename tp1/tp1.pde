PImage foto;
 void setup()
 {
   size(800,400);
   foto = loadImage("latam&m.jpeg");
   foto.resize(400, 400);
 }
 void draw() {
   background(255);//fondo blanco
   
   println ("X:");
   println(mouseX);
   println ("Y:");
   println (mouseY);
   
   //imagen a la izquierda
   image(foto, 0, 0);
   
   //linea divisoria
   stroke(0);
   line(400, 0, 400, 400);
   
   // cara
   fill (255, 204, 0); //color amarillo
   noStroke();
   ellipse(600, 200, 300, 300); // 8x, y, ancho, alto)
   
    //ceja izquierda
 noFill();
stroke(0);
strokeWeight(10);
beginShape();
curveVertex(506, 110);  // punto antes del inicio real
curveVertex(506, 110);  // inicio visible
curveVertex(519, 97);  // medio
curveVertex(564, 76);   // 
curveVertex(564, 76);
endShape();

 //ceja derecha
 noFill();
stroke(0);
strokeWeight(10);
beginShape();
curveVertex(687, 128);  
curveVertex(687, 128);  
curveVertex(670, 104); 
curveVertex(642, 84);
curveVertex(642, 84);
endShape();

//pupila negra chica izquierda
    fill(255); //color 
   noStroke();
   endShape();

   //ojo izquierdo
  pushMatrix();
  translate(543, 138);
  rotate (radians(40));
  fill(255);
  noStroke();
  ellipse(0, 0, 70, 90);
  popMatrix();
  
  //ojo derecho
  pushMatrix();
  translate(633, 138);
  rotate (radians(-40));
  fill(255);
  noStroke();
  ellipse(0, 0, 70, 90);
  popMatrix();
  
  //pupila izquierda
   fill(0); //color negro
   noStroke();
   ellipse(555, 125, 30, 35);
   
   //pupila derecha
    fill(0); //color negro
   noStroke();
   ellipse(620, 125, 30, 35);
   
   //pupila negra chica izquierda
    fill(255); //color blanco
   noStroke();
   ellipse(554, 125, 8, 15);
   
   //pupila negra chica derecha
    fill(255); //color blanco
   noStroke();
   ellipse(618, 125, 8, 15);

//boca
noFill();
stroke(0);
strokeWeight(2);
beginShape();
curveVertex(502, 236);  // punto invisible (antes del inicio)
curveVertex(502, 236);  // inicio visible 
curveVertex(547, 243);  // punto del medio más bajo (esto da la curva)
curveVertex(609, 241);  // fin visible 
curveVertex(663, 228);  // punto invisible (después del final)
curveVertex(690, 188); 
curveVertex(690, 180); 
endShape();

//sombra negra debajo de la boca
fill(0);
noStroke(); //sin borde
beginShape();
vertex(576, 244); //inicio izquierda de la boca
bezierVertex(635, 270, 650, 265, 674, 217);
endShape(CLOSE);


//lengua roja dentro de la boca
pushMatrix(); //guarda el estado actual de coordenadas
  translate(650, 240); //mueve todo
  rotate (radians(40)); //rota todos dsp de los 40grados
  fill(255, 0, 0); //color rojo
  noStroke(); //quita el borde de la figura
  ellipse(0, 0, 20, 40); //dibuja una elipse de la nueva posicion
  popMatrix();

//letra M
fill(255);
textSize(210);
textAlign(CENTER, CENTER);
text("m", 591, 319);

//linea dentro de la lengua
stroke(0);
strokeWeight(3);//grosor de la linea
line(645, 232, 650, 245);
 }


 
   
 
 
 
   
 
