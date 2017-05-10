public class Zombie
{
  private int x, y, size, solution, txtSize, level, xMovement;
  private float speed;
  private String equation;
  private PImage picture;
  
  Zombie(int lvl, String eq, int result)
  {
    this.size = (int) random(35, 90);
    this.speed = getSpeed(lvl);
    //damage = getDamage(lvl);
    this.picture = loadImage("assets/zombie.png");
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
    this.x += this.xMovement;
  }
  
  void draw()
  {
    image(this.picture, x-size/2, y-size/2);
    String txt = this.equation;
    textSize(this.txtSize);
    text(txt, this.x - textWidth(txt)/2, this.y + this.size/2 + this.txtSize);
  }
  
  float getSpeed(int lvl)
  {
    switch (lvl)
    {
      case 1:
      { 
        this.speed = random(1,4);
      } 
      break;
      case 2:
      { 
        this.speed = random(2,4);
      } 
      break;
      case 3:
      { 
        this.speed = random(2,5);
      } 
      break;  
      default: 
        break;
    }
    return this.speed;
  }
  
  float randomMovement(int x)
  {
    float r = random(-5, 5);
    System.out.println(r);
    return r;
  }
  
}
  
  

