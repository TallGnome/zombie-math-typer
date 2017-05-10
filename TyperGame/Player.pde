public class Player{
 
  int velocityX, velocityY;
  int size;
  int x, y;
  
  PImage picture;
  
  boolean holdingW, holdingA, holdingS, holdingD;
  
  
 
 Player(){
  
  size = PLAYERSIZE;
  picture = loadImage("assets/PLACEHOLDER.png");
  picture.resize(size, size);
  x = width/2;
  y = height - height/5;

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

void move(){
  if(holdingW){
    y -= PLAYERSPEED;
  }
  if(holdingS){
    y += PLAYERSPEED;
  }
  if(holdingA){
    x -= PLAYERSPEED;
  }
  if(holdingD){
    x += PLAYERSPEED;
  }
}


 void draw(){
    image(picture, x-size/2, y-size/2);
 } 
  
  
  
}
