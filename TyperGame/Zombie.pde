public class Zombie
{
  int x, y, size;
  
  Zombie(int s)
  {
    x = (int) random(0+s,width-s);
    y = s;
    size = s;
  }
  
  void move()
  {
    y += 2; 
  }
  
  void draw()
  {
    pushStyle();
    fill(color(#418e2c));
    noStroke();
    ellipse(x,y,size,size);
    popStyle();
    String txt = "E=mc2"; //TODO: Populate array String[] equations, "Shuffle" it, Traverse array and use every equation once.
    text(txt, x - textWidth(txt)/2, y + size);
  }
  
  
}
