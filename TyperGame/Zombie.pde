public class Zombie
{
  int x, y, size, first, second, solution, speed, txtSize, level;
  String equation;
  PImage picture;
  
  Zombie(int lvl)
  {
    size = (int) random(50, 100);
    speed = getSpeed(lvl);
    picture = loadImage("assets/zombie.png");
    picture.resize(size,size);
    x = (int) random(0+size,width-size); //Zombie starts in a random horizontal position from the top of the screen.
    y = size; 
    first = (int) random(1,9);
    second = (int) random(1,9);
    equation = first + " + " + second;
    solution = first + second;
    txtSize = 20;
    level = lvl;
  }
  
  void move()
  {
    y += speed;
    //size += 1;
  }
  
  void draw()
  {
    /*pushStyle();
    fill(color(#418e2c));
    noStroke();
    ellipse(x,y,size,size);
    popStyle();*/
    image(picture, x-size/2, y-size/2);
    String txt = equation; //TODO: Populate array String[] equations, "Shuffle" it, Traverse array and use every equation once.
    textSize(txtSize);
    text(txt, x - textWidth(txt)/2, y + size/2+txtSize);
  }
  
  int getSpeed(int lvl)
  {
    switch (lvl)
    {
      case 1:
      { 
        speed = (int) random(1,4);
      } 
      break;
      case 2:
      { 
        speed = (int) random(1,5);
      } 
      break;
      case 3:
      { 
        speed = (int) random(2,5);
      } 
      break;  
      default: 
        break;
    }
    return speed;
  }
}
  
  

