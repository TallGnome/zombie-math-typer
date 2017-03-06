/**
*   TyperGame
*   
*/

ArrayList<Zombie> zombies;
int starttime, currtime, spawnrate;

void setup(){
  size(820,640); 
  frameRate(60);
  zombies = new ArrayList<Zombie>();
  zombies.add(new Zombie(50));
  starttime = millis();
  spawnrate = 2000; //ms
}

void draw(){
  
  noCursor();
  background(0); //Black
 

 for(int i=0; i<zombies.size(); i++)
 {
   zombies.get(i).move();
   zombies.get(i).draw();
 }
  
  
  currtime = millis();
  
  if(currtime - starttime >= spawnrate)
  {
    zombies.add(new Zombie((int) random(30,100)));
    starttime = currtime;
  }
}
