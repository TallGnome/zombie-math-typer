public class Zombie
{
  int x, y, size, first, second, solution, txtSize;
  String equation;
  PImage picture;
  
  Zombie(int s)
  {
    picture = loadImage("assets/zombie.png");
    picture.resize(s,s);
    x = (int) random(0+s,width-s); //Zombie starts in a random horizontal position from the top of the screen.
    y = s; 
    size = s;
    first = (int) random(10,100);
    second = (int) random(10,100);
    equation = first + " + " + second;
    solution = first + second;
    txtSize = 20;
  }
  
  void move()
  {
    y += (int) random(1,3);
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
  
  
}
