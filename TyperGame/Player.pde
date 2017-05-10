public class Player{
 
  int velocityX, velocityY;
  int size, hp;
  int x, y;
  
  float health;
  float max_health;
  
  PImage picture;
  
  //boolean holdingW, holdingS;
  boolean holdingA, holdingD;
  
  
 
 Player(){
  
  size = PLAYERSIZE;
  hp = 100;
  picture = loadImage("assets/MEMEMASTER.png");
  picture.resize(size, size*2);
  x = width/2;
  y = height - height/5;
  health = MAX_HP;
  max_health = MAX_HP;
  
  
 }
 
 void keyPressed(){
  if (key == 'a' || key == 'A'){
    holdingA = true;  
  }
  if (key == 'd' || key == 'D'){
    holdingD = true;
  }
 }
 
  void keyReleased(){
   /*if (key == 'w' || key == 'W'){
    holdingW = false; 
   }*/
   if (key == 'a' || key == 'A'){
    holdingA = false; 
   }
   /*if (key == 's' || key == 'S'){
    holdingS = false; 
   }*/
   if (key == 'd' || key == 'D'){
    holdingD = false; 
   }
 }

void move(){
  /*if(holdingW){
    y -= MOVESPEED;
  }
  if(holdingS){
    y += MOVESPEED;
  }*/
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
