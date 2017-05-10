public class Zombie
{
  int x, y, size, solution, txtSize, level, xMovement;
  float speed;
  String equation;
  PImage picture;
  
  Zombie(int lvl, String eq, int result)
  {
    this.size = (int) random(35, 90);
    this.speed = getSpeed(lvl);
    this.picture = loadImage("assets/zombie.png");
    this.picture.resize(size,size);
    this.x = (int) random(0+size,width-size); //Zombie starts in a random horizontal position from the top of the screen.
    this.y = size; 
    this.equation = eq;
    this.solution = result;
    this.xMovement = (int) random(-2,2);    
    this.txtSize = 20;
    this.level = lvl;
  }
  
  void move()
  {
    y += speed;
    x += xMovement;
  }
  
  void draw()
  {
    image(picture, x-size/2, y-size/2);
    String txt = equation;
    textSize(txtSize);
    text(txt, x - textWidth(txt)/2, y + size/2+txtSize);
  }
  
  float getSpeed(int lvl)
  {
    switch (lvl)
    {
      case 1:
      { 
        speed = random(1,4);
      } 
      break;
      case 2:
      { 
        speed = random(2,4);
      } 
      break;
      case 3:
      { 
        speed = random(2,5);
      } 
      break;  
      default: 
        break;
    }
    return speed;
  }
  
  float randomMovement(int x)
  {
    float r = random(-5, 5);
    System.out.println(r);
    return r;
  }
  
}
  
  

