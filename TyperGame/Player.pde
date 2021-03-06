public class Player{
 
  private int velocityX, velocityY;
  private int size, hp;
  private int x, y;
  
  private float health;
  private float max_health;
  
  private PImage picture;
  
  //boolean holdingW, holdingS;
  private boolean holdingA, holdingD;
  
  
 
 Player(){
  
  this.size = PLAYERSIZE;
  this.hp = 100;
  this.picture = loadImage("assets/MEMEMASTER.png");
  this.picture.resize( this.size, this.size * 2 );
  this.x = width/2;
  this.y = height - height/5;
  this.health = MAX_HP;
  this.max_health = MAX_HP;
  
  
 }
 
 void keyPressed(){
  if (key == 'a' || key == 'A'){
    this.holdingA = true;  
  }
  if (key == 'd' || key == 'D'){
    this.holdingD = true;
  }
 }
 
  void keyReleased(){
   if (key == 'a' || key == 'A'){
    this.holdingA = false; 
   }
   if (key == 'd' || key == 'D'){
    this.holdingD = false; 
   }
 }

void move(){
  if(this.holdingA){
    this.x -= PLAYERSPEED;
  }
  if(this.holdingD){
    this.x += PLAYERSPEED;
  }
}


 void draw(){
    image(this.picture, this.x - this.size / 2, this.y - this.size / 2);
 } 
 
 public int getX(){
   return x;
 }
 
 public int getY(){
  return y;
 }
  
  
}
