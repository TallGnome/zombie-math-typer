//import processing.sound.*;
import java.util.Map;

//SoundFile file;
ArrayList<Zombie> zombies;
int starttime, currtime, spawnrate, score, level, textsize, streak, streakgoal, zombiesinlevel, iterator;
String typing, typingtemp, txt;
Player player;
HashMap<String, Integer> hash;
Equation eq;
String[] equations;
int[] results;

static final float MAX_HP = 100;

void setup() {
  size(800, 640); 
  frameRate(60);
  level = 1;
  player = new Player();
  zombiesinlevel = 8;
  zombies = new ArrayList<Zombie>();
  //player = new Player(50);
  starttime = millis();
  spawnrate = 4000; //ms
  typing = typingtemp = ""; //Used for user typing display.
  score = 0; //Initial score.
  textsize = 20; //Size of texts such as score, levels etc.
  streak = 0; //Correct guesses in a row.
  streakgoal = 10; //What value streak count must reach to be able to clear screen.
   
  createArrays();
   
}



void draw() {
  noCursor();
  background(0); //Black

  //player.draw();

  //Bad programming?? fix VVVVV
  if(zombiesinlevel == 0)
  {
    if(level == 1)
    {
      level++;
      zombiesinlevel = 12;
      spawnrate -= 500;
      createArrays();  
    }
    else if(level == 2)
    {
      level++;  
      zombiesinlevel = 15;
      spawnrate -= 500;
      createArrays();
    }
    else if(level == 3)
    {
      level++;  
      zombiesinlevel = 18;
      spawnrate -= 500;
      createArrays();
    } 
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
  if(streak>=streakgoal)
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
  text(txt, width-textWidth(txt)-width/70, height - textsize); 
  popStyle();
  
  //Spawn rate text
  pushStyle();
  fill(color(255));
  textSize(textsize);
  txt = "Spawn rate: " + Integer.toString(spawnrate/1000) + "s"; //milliseconds to seconds ignores the float part (i.e 2500ms to 2s)
  text(txt, width-textWidth(txt)-10, height - 2*textsize); 
  popStyle();
  
  //Zombies left text
  pushStyle();
  fill(color(255));
  textSize(textsize);
  txt = "Zombies left: " + Integer.toString(zombiesinlevel); 
  text(txt, width-textWidth(txt)-10, height - 3*textsize); 
  popStyle();
  
  //User typing display
  pushStyle();
  fill(color(255));
  textSize(20);
  text(typing, 15, 30); 
  popStyle();

  for (int i=0; i<zombies.size (); i++)
  {
    zombies.get(i).draw();
    zombies.get(i).move();
    
    // If the zombie reaches the end of the screen, deal damage and delete the zombie.
    if( zombies.get(i).y > height - zombies.get(i).size ){
      player.health -= 5;
      zombies.remove(i);
    }
  }


  currtime = millis();

  if (currtime - starttime >= spawnrate)
  {
    zombiesinlevel--;
    Zombie newzombie = new Zombie(level, equations[iterator], results[iterator]);
    zombies.add(newzombie);
    starttime = currtime;
    iterator++;
  }

  pushStyle();
  fill(color(255));
  textSize(20);
  text(typing, 15, 30); 
  popStyle();
  
  
  player.move();
  player.draw();
    
  //Health bar
  pushStyle();
  stroke(color(255), 100);
  noFill();
  rect(width/2-101, 15, 202, 40, 7);
  popStyle(); 
  pushStyle();
  
  if (player.health > MAX_HP){
     player.health = MAX_HP;
  }
  if (player.health < 0){
     player.health = 0; 
  }
  if (player.health < 26){
    fill(255, 29, 0);
  }else if (player.health < 51){
    fill(255, 161, 0);
  }else{
    fill(26, 201, 0);
  }
  rect(width/2-100, 16, player.health*2, 38, 5);
  popStyle();
    
}

void keyPressed(){
  // PLAYER MOVEMENT WITH THE WASD KEYS
  /*if (key == 'w' || key == 'W'){
    player.holdingW = true;
  }*/
  if (key == 'a' || key == 'A'){
    player.holdingA = true;
  }
  /*if (key == 's' || key == 'S'){
    player.holdingS = true;
  }*/
  if (key == 'd' || key == 'D'){
    player.holdingD = true;
  }
}


void keyReleased() 
{
  switch (key)
  {
  case '0':
    { 
      typingtemp += "0";
    } 
    break;
  case '1':
    { 
      typingtemp += "1";
    } 
    break;
  case '2':
    { 
      typingtemp += "2";
    } 
    break;
  case '3':
    { 
      typingtemp += "3";
    } 
    break;  
  case '4':
    { 
      typingtemp += "4";
    } 
    break;
  case '5':
    { 
      typingtemp += "5";
    } 
    break;  
  case '6':
    { 
      typingtemp += "6";
    } 
    break;
  case '7':
    { 
      typingtemp += "7";
    } 
    break;  
  case '8':
    { 
      typingtemp += "8";
    } 
    break;
  case '9':
    { 
      typingtemp += "9";
    } 
    break; 
  case '-':
    {
      if(typingtemp == "")
      {
        typingtemp += "-";
      }
    }
    break;
  case 'c':
    { 
      if(streak >= streakgoal)
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
    typingtemp = "";
    break;
  case BACKSPACE:
    { 
      if (typing.length() > 0)
      {
        typing = typing.substring(0, typing.length() - 1);
        typingtemp = typing;
      }
    }
    // PLAYER MOVEMENT CANCEL ON RELEASE
   /*case 'w':
   {
     player.holdingW = false;
   }
   case 's':
   {
     player.holdingS = false;
   }*/
   case 'a':
   {
     player.holdingA = false;
   }
   break;
   case 'd':
   {
     player.holdingD = false;
   }
    break;
   case 'A':
   {
     player.holdingA = false;
   }
   break;
   case 'D':
   {
     player.holdingD = false;
   }
    break;
  default: 
    break;
  }
  if(typingtemp.length() <= 6) 
  {
    typing = typingtemp;
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
      player.health += 5;
    }
  }
  return correct;
}

void createArrays()
{
  
  //TO PARAKATW EINAI TO XEIROTERO PRAGMA POU EXEI FTIAXTEI STIN ISTORIA TOU PROGRAMATISMOU!!! ALLA DOULEVEI PROS TO PARWN!!!
  iterator = 0;
  equations = new String[zombiesinlevel];
  results = new int[zombiesinlevel];
  eq = new Equation();
  hash = new HashMap<String, Integer>();
  hash = eq.nextEquation(level, zombiesinlevel);
  int asdf = 0;
  for (Map.Entry me : hash.entrySet()) {
    equations[asdf] = me.getKey().toString();
    results[asdf] = Integer.parseInt(me.getValue().toString());
    asdf++;
  }
  println();
  println("---------Difficulity " + level + "---------");
  for(int i = 0; i < asdf; i++)
 {
   System.out.println(equations[i] + " = " + results[i]);
 }
 
}

