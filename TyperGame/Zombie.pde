public class Zombie
{
  //int first, second;
  int x, y, size, solution, speed, txtSize, level, damage;
  String equation;
  PImage picture;
  
  Zombie(int lvl, String eq, int result)
  {
    size = (int) random(40, 80);
    speed = getSpeed(lvl);
    //damage = getDamage(lvl);
    picture = loadImage("assets/zombie.png");
    picture.resize(size,size);
    x = (int) random(0+size,width-size); //Zombie starts in a random horizontal position from the top of the screen.
    y = size; 
    equation = eq;
    solution = result;
    /*first = (int) random(1,9);
    second = (int) random(1,9);
    if(lvl == 1)
    {
      equation = first + " + " + second;
      solution = first + second;
    }
    else
    {
      equation = first + " * " + second;
      solution = first * second;
    }*/
    
    
    
    txtSize = 20;
    level = lvl;
  }
  
  void move()
  {
    y += speed;
  }
  
  void draw()
  {
    image(picture, x-size/2, y-size/2);
    String txt = equation;
    textSize(txtSize);
    text(txt, x - textWidth(txt)/2, y + size/2+txtSize);
  }
  
  int getSpeed(int lvl)
  {
    int sp = 0;
    switch (lvl)
    {
      case 1:
      { 
        sp = (int) random(1,2);
      } 
      break;
      case 2:
      { 
        sp = (int) random(1,3);
      } 
      break;
      case 3:
      { 
        sp = (int) random(2,5);
      } 
      break;  
      default: 
        break;
    }
    return sp;
  }
  
//  int getDamage(int lvl){
//    int dmg = 0;
//    switch (lvl)
//    {
//      case 1:
//      {
//            
//      }
//    }
//  }
}
  
  

