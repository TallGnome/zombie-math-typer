public class Player{
 
  private int velocityX, velocityY;
  private int size, hp;
  private int x, y;
  
  private float health;
  private float max_health;
  
  private PImage picture;
  
  // Load images here
  private PImage img1 = loadImage("assets/MEMEMASTER.png");
  private PImage img2 = loadImage("assets/MEMEMASTER2.png");
  private PImage img3 = loadImage("assets/MEMEMASTER3.png");
  
  //boolean holdingW, holdingS;
  private boolean holdingA, holdingD;
  
  
 
 Player(){
  
  this.size = PLAYERSIZE;
  this.hp = 100;
  this.picture = img2;
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
 
 public void changeImage(int x){
   switch (x){
     case 1:{
       this.picture = img1;
       this.picture.resize( this.size, this.size * 2 );
     }
     case 2:{
       this.picture = img2;
       this.picture.resize( this.size, this.size * 2 );
     }
     case 3:{
       this.picture = img3;
       this.picture.resize( this.size, this.size * 2 );
     }
   }
 }
  
  
}
