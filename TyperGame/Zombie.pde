public class Zombie
{
  int x, y, size;
  String equation;
  
  Zombie(int s)
  {
    x = (int) random(0+s,width-s); //Zombie starts in a random horizontal position from the top of the screen.
    y = s; 
    size = s;
    equation = (((int) random(10,100)) + " + " + ((int) random(10,100)));
  }
  
  void move()
  {
    y += (int) random(1,6);
    //size += 1;
  }
  
  void draw()
  {
    pushStyle();
    fill(color(#418e2c));
    noStroke();
    ellipse(x,y,size,size);
    popStyle();
    String txt = equation; //TODO: Populate array String[] equations, "Shuffle" it, Traverse array and use every equation once.
    text(txt, x - textWidth(txt)/2, y + size);
  }
  
  
}
