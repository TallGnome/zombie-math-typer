/**
*   TyperGame
*   
*/

Zombie test;

void setup(){
  size(600,800); 
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
