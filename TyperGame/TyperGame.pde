/**
 *   TyperGame
 *   
 */

//import processing.sound.*;

//SoundFile file;
ArrayList<Zombie> zombies;
//ArrayList<Integer> solutions;
int starttime, currtime, spawnrate, score, level;
String typing;

void setup() {
  size(668, 800); 
  frameRate(60);
  zombies = new ArrayList<Zombie>();
  zombies.add(new Zombie(50));
  //solutions = new ArrayList<Integer>();
  starttime = millis();
  spawnrate = 3000; //ms
  typing = "";
  score = 0;
  level = 1;
}


void draw() {

  noCursor();
  background(0); //Black

  //Bad programming fix VVVVV
  if(score == 10 && level == 1)
  {
    level++;
    spawnrate -= 1000;  
  }
  if(score == 20 && level == 2)
  {
    level++;  
    spawnrate -= 500;
  }
  

  pushStyle();
  fill(color(255));
  textSize(20);
  text("Score: " + Integer.toString(score), width - textWidth("Score: " + Integer.toString(score))-10,25); 
  popStyle();
  
  pushStyle();
  fill(color(255));
  textSize(20);
  text("Level: " + Integer.toString(level), width - textWidth("Level: " + Integer.toString(level))-10,height - 20); 
  popStyle();

  for (int i=0; i<zombies.size (); i++)
  {
    zombies.get(i).move();
    zombies.get(i).draw();
  }


  currtime = millis();

  if (currtime - starttime >= spawnrate)
  {
    Zombie newzombie = new Zombie((int) random(50, 100));
    zombies.add(newzombie);
    //solutions.add(newzombie.solution);
    starttime = currtime;
  }

  pushStyle();
  fill(color(255));
  textSize(20);
  text(typing, 15, 30); 
  popStyle();
}


void keyReleased() 
{
  switch (key)
  {
  case '0':
    { 
      typing += "0";
    } 
    break;
  case '1':
    { 
      typing += "1";
    } 
    break;
  case '2':
    { 
      typing += "2";
    } 
    break;
  case '3':
    { 
      typing += "3";
    } 
    break;  
  case '4':
    { 
      typing += "4";
    } 
    break;
  case '5':
    { 
      typing += "5";
    } 
    break;  
  case '6':
    { 
      typing += "6";
    } 
    break;
  case '7':
    { 
      typing += "7";
    } 
    break;  
  case '8':
    { 
      typing += "8";
    } 
    break;
  case '9':
    { 
      typing += "9";
    } 
    break;  
  case ENTER:
    {
      if (typing.length() > 0)
      {
        if (checkAnswer(typing))
        {
          score++;
          //file = new SoundFile(this, "correct.mp3");
          //file.play();
        } else
        {
          //file = new SoundFile(this, "wrong.mp3");
          //file.play();
        }
      }
    } 
    typing = "";
    break;
  case BACKSPACE:
    { 
      if (typing.length() > 0)
      {
        typing = typing.substring(0, typing.length() - 1);
      }
    } 
    break;
  default: 
    break;
  }
}

boolean checkAnswer(String answer)
{
  boolean correct = false;
  int answerToInt = Integer.parseInt(answer);
  for (int i=0; i < zombies.size (); i++)
  {
    if (answerToInt == zombies.get(i).solution)
    {
      zombies.remove(i);
      correct = true;
    }
  }
  return correct;
}

