public class Player{
 
  int velX, velY;
  float size;
  float x,y;
  boolean holdingW, holdingA, holdingS, holdingD;
  
 
 Player(int s){
  this.size = s;
  this.x = width/2;
  this.y = height/2;
  
  holdingW = false;
  holdingA = false;
  holdingS = false;
  holdingD = false;
 }
 
 void keyPressed(){
  if (key == 'w' || key == 'W'){
    holdingW = true;
  } 
  if (key == 'a' || key == 'A'){
    holdingA = true;
  }
  if (key == 's' || key == 'S'){
    holdingS = true;
  }
  if (key == 'd' || key == 'D'){
    holdingD = true;
  }
 }
 
 void keyReleased(){
   if (key == 'w' || key == 'W'){
    holdingW = false; 
   }
   if (key == 'a' || key == 'A'){
    holdingA = false; 
   }
   if (key == 's' || key == 'S'){
    holdingS = false; 
   }
   if (key == 'd' || key == 'D'){
    holdingD = false; 
   }
 }
 
 void draw(){
    pushStyle();
    fill(color(255));
    noStroke();
    ellipse(x,y, size, size);
    popStyle();  
 } 
  
  
  
}
