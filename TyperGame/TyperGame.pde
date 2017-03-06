/**
*   TyperGame
*   
*/

Zombie test;

void setup(){
  size(820,640); 
  frameRate(60);
  test = new Zombie(50); //Testing a "zombie" with 50px size.
}

void draw(){
  noCursor();
  background(0); //Black
  //Zombie
  test.move();
  test.draw();
  
}
