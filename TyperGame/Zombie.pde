public class Zombie
{
  int x, y, size, solution, txtSize, level, xMovement;
  float speed;
  String equation;
  boolean kms, bot;
  PImage picture;
  
  Zombie(int lvl, String eq, int result)
  {
    kms = false;
    bot = false;
    size = (int) random(40 , 80);
    speed = getSpeed(lvl);
    picture = loadImage("assets/zombie.png");
    picture.resize(size,size);
    x = (int) random(0+size,width-size); //Zombie starts in a random horizontal position from the top of the screen.
    y = size; 
    
    equation = eq;
    solution = result;
    xMovement = (int) random(-3,3);    
    txtSize = 20;
    level = lvl;
  }
  
  void move()
  {
    y += speed;
    
    //Bounce on walls
    if(xMovement != 0)
    {
       if(width-x < size/2 || x < size/2)
        {
          xMovement *= -1;
        }
    }
   
    x += xMovement;

    
  }
  
  void draw()
  {
    
   //If zombie collides with player or the floor
    if(dist(x,y,player.x,player.y) <= size)
    {
      kms = true;
    }
    
    if(y > height + size/4)
    {
      bot = true;
    }
    
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
  
  

