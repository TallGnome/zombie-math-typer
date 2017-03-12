//import processing.sound.*;
import java.util.Map;
//SoundFile file;
ArrayList<Zombie> zombies;
int starttime, currtime, spawnrate, score, level, textsize, streak;
String typing, txt;

HashMap<String, Integer> hash;

Equation eq;

void setup() {
  size(700, 800); 
  frameRate(60);
  eq = new Equation();
  hash = new HashMap<String, Integer>();
  hash = eq.nextEquation(5, 5);
  for (Map.Entry me : hash.entrySet()) {
    print(me.getKey() + " is ");
    println(me.getValue());
  }
  level = 1;
  zombies = new ArrayList<Zombie>();
  starttime = millis();
  spawnrate = 3000; //ms
  typing = ""; //What the user is writing 
  score = 8;
  textsize = 20; //Size of texts such as score, levels etc.
  streak = 0; //Solving streak
}


void draw() {

  noCursor();
  background(0); //Black

  //Bad programming?? fix VVVVV
  if(score == 10 && level == 1)
  {
    level++;
    spawnrate -= 500;  
  }
  else if(score == 20 && level == 2)
  {
    level++;  
    spawnrate -= 500;
  }
  else if(score == 30 && level == 3)
  {
    level++;  
    spawnrate -= 500;
  }
  
  //Score text
  pushStyle();
  fill(color(255));
  textSize(textsize);
  txt = "Score: " + Integer.toString(score);
  text(txt, width - textWidth(txt)-width/70 , height/40); 
  popStyle();
  
  //Streak text
  pushStyle();
  fill(color(255));
  textSize(textsize);
  if(streak>=5)
  {
    txt = "Press 'c' to clear screen";
  }
  else
  {
    txt = "Streak: " + Integer.toString(streak);
  }
  text(txt, width-textWidth(txt)-10, height/40 + textsize); 
  popStyle();
  
  //Level text
  pushStyle();
  fill(color(255));
  textSize(textsize);
  txt = "Level: " + Integer.toString(level);
  text(txt, width-textWidth(txt)-width/70, height - textsize+5); 
  popStyle();
  
  //Spawn rate text
  pushStyle();
  fill(color(255));
  textSize(textsize);
  txt = "Spawn rate: " + Integer.toString(spawnrate/1000) + "s"; //milliseconds to seconds ignores the float part (i.e 2500ms to 2s)
  text(txt, width-textWidth(txt)-10, height - 2*textsize); 
  popStyle();

  for (int i=0; i<zombies.size (); i++)
  {
    zombies.get(i).move();
    zombies.get(i).draw();
  }


  currtime = millis();

  if (currtime - starttime >= spawnrate)
  {
    Zombie newzombie = new Zombie(level);
    zombies.add(newzombie);
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
  case 'c':
    { 
      if(streak>=5)
      {
        score += zombies.size();
        zombies = new ArrayList<Zombie>();
        streak = 0;
      }
    } 
  break;   
  case ENTER:
    {
      if (typing.length() > 0)
      {
        if (checkAnswer(typing))
        {
          score++;
          streak++;
          //file = new SoundFile(this, "correct.mp3");
          //file.play();
        } else
        {
          streak = 0;
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

