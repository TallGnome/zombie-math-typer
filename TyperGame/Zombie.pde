public class Zombie
{

  private int x, y, size, solution, txtSize, level, xMovement;
  private float speed;
  private String equation;
  private PImage picture;
  private boolean kms, bot;
  
  Zombie(int lvl, String eq, int result)
  {
    this.kms = false;
    this.bot = false;
    this.size = (int) random(40, 80);
    this.speed = getSpeed(lvl);
    //damage = getDamage(lvl);
    if (random(-10,2) > 0){
        this.picture = loadImage("assets/zombie2.png");
     }
     else{
       this.picture = loadImage("assets/zombie.png");
     }
    
    this.picture.resize(this.size, this.size);
    this.x = (int) random(0 + this.size, width - this.size); //Zombie starts in a random horizontal position from the top of the screen.
    this.y = this.size; 
    this.equation = eq;
    this.solution = result;
    this.xMovement = (int) random(-2,2);    
    this.txtSize = 20;
    this.level = lvl;

  }
  
  void move()
  {
    this.y += this.speed;
    
    //Bounce on walls
    if(this.xMovement != 0)
    {
       if(width-this.x < this.size/2 || this.x < this.size/2)
        {
          this.xMovement *= -1;
        }
    }
   
    this.x += this.xMovement;
  }
  
  void draw()
  {  
   //If zombie collides with player or the floor
    if(dist(this.x,this.y,player.getX(),player.getY()) <= this.size)
    {
      this.kms = true;
    }
    
    if(this.y > height + this.size/4)
    {
      this.bot = true;
    }
    
    image(this.picture, this.x-this.size/2, this.y-this.size/2);
    String txt = this.equation;
    textSize(txtSize);
    if(txt != null){
      text(txt, this.x - textWidth(txt)/2, this.y + this.size/2+txtSize);
    }
  }
  
  float getSpeed(int lvl)
  {
    switch (lvl)
    {
      case 1:
      { 
        this.speed = random(1,2);
      } 
      break;
      case 2:
      { 
        this.speed = random(1,2);
      } 
      break;
      case 3:
      { 
        this.speed = random(1,2);
      } 
      break;
      case 4:
      { 
        this.speed = random(1,3);
      } 
      break;  
      case 5:
      { 
        this.speed = random(2,3);
      } 
      break;  
      case 6:
      { 
        this.speed = random(2,3);
      } 
      break;
      case 7:
      { 
        this.speed = 1;
      } 
      break;     
      default: 
        break;
    }
    return this.speed;
  }
  
}
  
  

