public class Player{
 
  int velocityX, velocityY;
  int size, hp;
  int x, y;
  
  float health;
  float max_health;
  
  PImage picture;
  
  //boolean holdingW, holdingS;
  boolean holdingA, holdingD;
  
  static final int MOVESPEED = 5;
  static final int PLAYERSIZE = 40;
  static final float MAX_HP = 100;
  static final float rectWidth = 200;
 
 Player(){
  
  size = PLAYERSIZE;
  hp = 100;
  picture = loadImage("assets/PLACEHOLDER.png");
  picture.resize(size, size);
  x = width/2;
<<<<<<< HEAD
  y = height-size/2;

=======
  y = height - height/5;
  health = MAX_HP;
  max_health = MAX_HP;
  
  
>>>>>>> e1202a004e7719a3cc07037d9f8722946cb395fe
 }
 
 void keyPressed(){
  /*if (key == 'w' || key == 'W'){
    holdingW = true;
  } */
  if (key == 'a' || key == 'A'){
    holdingA = true;  
  }
  /*if (key == 's' || key == 'S'){
    holdingS = true;
  }*/
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
  }*/
  /*if(holdingS){
    y += MOVESPEED;
  }*/
  if(holdingA){
    x -= MOVESPEED;
  }
  if(holdingD){
    x += MOVESPEED;
  }
}


 void draw(){
    image(picture, x-size/2, y-size/2);
 } 
  
  
}
