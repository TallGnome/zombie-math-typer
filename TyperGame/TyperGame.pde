import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


import ddf.minim.*;
Minim minim;
AudioSample zombieSpawn, zombieDeath, screenMusic, loseHP, thunder;
AudioPlayer ambience;
AudioInput input;

//import processing.sound.*;
import java.util.Map;

//State constants

static final int MAIN_STATE = 0;
static final int SELECTION_STATE = 1;
static final int PLAY_STATE = 2;
static final int END_STATE = 3;

static final int WINDOW_WIDTH = 800;
static final int WINDOW_HEIGHT = 640;

static final int PLAYERSPEED = 5;
static final int PLAYERSIZE = 50;

//SoundFile file;
ArrayList<Zombie> zombies;
int starttime, currtime, spawnrate, score, level, textsize, streak, streakgoal, zombiesinlevel, iterator;
String typing, typingtemp, txt;
Player player;
HashMap<String, Integer> hash;
Equation eq;
String[] equations;
int[] results;
int state;

static final float MAX_HP = 100;

void setup() {
  size(WINDOW_WIDTH, WINDOW_HEIGHT); 
  frameRate(144);
  
  level = 1;
  player = new Player();
  zombiesinlevel = 10;
  zombies = new ArrayList<Zombie>();
  starttime = millis();
  spawnrate = 4000; //ms
  typing = typingtemp = ""; //Used for user typing display.
  score = 0; //Initial score.
  textsize = 20; //Size of texts such as score, levels etc.
  streak = 0; //Correct guesses in a row.
  streakgoal = 10; //What value streak count must reach to be able to clear screen.
  
  state = 0;

  createArrays();
  
  minim = new Minim(this);

  zombieDeath = minim.loadSample("assets/audio/zdeath.mp3");
  zombieSpawn = minim.loadSample("assets/audio/zspawn.mp3");
  loseHP = minim.loadSample("assets/audio/losehp.mp3");
  screenMusic = minim.loadSample("assets/audio/screenmusic.mp3");
  thunder = minim.loadSample("assets/audio/thunder.mp3");
  
  ambience = minim.loadFile("assets/audio/ambience.mp3");

  ambience.loop();
  ambience.setGain(-15.0);  
   
}

void draw() {
  noCursor();
  background(0); //Black
  
  // STATE 1 IS GAME STATE
  if (state == PLAY_STATE){ 
    populateZombies();
    //Score text
    drawScoreDisplay();
    //Streak text
    drawStreakDisplay();
    //Level text
    drawLevelDipslay();
    //Spawn rate text
    drawSpawnRateDisplay();
    //Zombies left text
    drawZombiesLeftDisplay();
    //User typing display
    drawUserTypingDisplay();
 
 
     drawZombies();

    for (int i=0; i<zombies.size (); i++){
      zombies.get(i).draw();
      zombies.get(i).move();
      
     if(zombies.get(i).kms == true || zombies.get(i).bot == true){
        if(zombies.get(i).kms == true)
        {
          player.health -= 10;
        }
        else
        {
          player.health -= 5;
  
        }
        zombies.remove(i);
        streak = 0;
        loseHP.trigger();
      }
    }
    
    
    

    player.move();
    player.draw();
    
    //Health bar
    drawHealthBar();

  }
  //STATE 0 IS MAIN MENU
  else if(state == 0){
    image(loadImage("assets/welcome.jpg"), 0, 0, width, height);
    pushStyle();
    fill(color(200, 200, 200, 80));
    rect(width/2-171, 35, 330, 85, 2);
    pushStyle();
    fill(255,100,100);
    textSize(32);
    text("Typocalypse!!!", width/2 - 125, 70); 
    fill(90);
    textSize(16);
    text("Math edition. (there is no other edition...)", width/2 - 165, 95); 
    //text("Math edition.", width/2 - 85, 75; 
    fill(0, 225, 0);    
    textSize(24);
    text("Press ENTER to continue...", width/2 - 155, height/2); 
  } 
}

void keyPressed(){
  if(!looping && key == 'y'){
        exit();
    }
  if(key == ESC || key == 'p'){
    if(looping){
      fill(255, 0 , 0);    
      textSize(42);
      text("ARE YOU SURE YOU WANT TO EXIT?", width/2 - 320, height/2 - 50); 
      textSize(28);
      text("PRESS Y TO EXIT \n OR PRESS ESC TO CONTINUE", width/2 - 300, height/2);
      key = "Z".charAt(0);
      noLoop();
    }else{
      loop();
      key = "Z".charAt(0);
    }
  }
  if (key == 'a' || key == 'A'){
    player.holdingA = true;
  }
  if (key == 'd' || key == 'D'){
    player.holdingD = true;  
  }
}


void keyReleased(){
  if(key == ESC){
    
  }
  if ( state == PLAY_STATE){
    handleKeysForPlayState(key);
  }
  else if( state == MAIN_STATE){
    handleKeysForMainState(key);
  }
}

boolean checkAnswer(String answer){
  boolean correct = false;
  if (answer == "-"){
    answer = "0";
  }
  int answerToInt = Integer.parseInt(answer);
  for (int i=0; i < zombies.size (); i++){
    if (answerToInt == zombies.get(i).solution){
      zombies.remove(i);
      correct = true;
      player.health += 2.5;
      zombieDeath.trigger();
    }
  }
  return correct;
}

void handleKeysForMainState(char k){
  switch (k){
    case ENTER:{
      state = PLAY_STATE;
    }break;
    case 'P':{
      
    }break;    
  }
}

void handleKeysForPlayState(char k){
    switch (k){
      case '0':{ 
        typingtemp += "0";
      }break;
      
      case '1':{ 
        typingtemp += "1";
      }break;
      
      case '2':{ 
        typingtemp += "2";
      }break;
      
      case '3':{ 
        typingtemp += "3";
      } break;
      
      case '4':{ 
         typingtemp += "4";
      }break;
      
      case '5':{ 
        typingtemp += "5";
      }break;  
      
      case '6':{ 
         typingtemp += "6";
      }break;
      
      case '7':{ 
         typingtemp += "7";
      }break;  
      
      case '8':{ 
        typingtemp += "8";
      }break;
      
      case '9':{ 
        typingtemp += "9";
      }break;
      
      case '-':{
        if(typingtemp == ""){
           typingtemp += "-";
        }
      }break;
      
      case 'c':{ 
        if(streak >= streakgoal){
          score += zombies.size();
          zombies = new ArrayList<Zombie>();
          streak = 0;
        }
      }break;
      
      case ENTER:{
          if (typing.length() > 0){
            if (typing.length() > 0){
            if (!typing.equals("-")){
              if (checkAnswer(typing)){
                score++;
                streak++;
              } else{
                streak = 0;
              }
            }
          }
       }
      } 
       typingtemp = "";
       break;
       
       case BACKSPACE:{ 
          if (typing.length() > 0){
            typing = typing.substring(0, typing.length() - 1);
            typingtemp = typing;
          }
       }
       
       case 'a':{
         player.holdingA = false;
       }break;
       
       case 'd':{
         player.holdingD = false;
       }break;
       
       case 'A':{
         player.holdingA = false;
       }break;
       
       case 'D':{
         player.holdingD = false;
       }break;
       
       default: 
        break;
    }
    if(typingtemp.length() <= 6) {
      typing = typingtemp;
    }
}

void drawZombies(){
    currtime = millis();

    if (currtime - starttime >= spawnrate){
      zombiesinlevel--;
      Zombie newzombie = new Zombie(level, equations[iterator], results[iterator]);
      zombies.add(newzombie);
      starttime = currtime;
      iterator++;
      zombieSpawn.trigger();
      if (random(-10,1) > 0){
        background(100);
        thunder.trigger();
      }
    }
    
}

void drawUserTypingDisplay(){
  pushStyle();
  fill(color(255));
  textSize(20);
  text(typing, player.x-textWidth(typing)/2, player.y+player.size*2); 
  popStyle();
}

void drawZombiesLeftDisplay(){
  pushStyle();
  fill(color(255));
  textSize(textsize);
  txt = "Zombies left: " + Integer.toString(zombiesinlevel); 
  text(txt, width-textWidth(txt)-10, height - 3*textsize + 5); 
  popStyle();
}

void drawSpawnRateDisplay(){
  pushStyle();
  fill(color(255));
  textSize(textsize);
  txt = "Spawn rate: " + Integer.toString(spawnrate/1000) + "s"; //milliseconds to seconds ignores the float part (i.e 2500ms to 2s)
  text(txt, width-textWidth(txt)-10, height - 2*textsize + 5); 
  popStyle();
}

void drawStreakDisplay(){
  pushStyle();
  fill(color(255));
  textSize(textsize);
  if(streak>=streakgoal){
    txt = "Press 'c' to clear screen";
  }
  else{
    txt = "Streak: " + Integer.toString(streak);
  }
  text(txt, width-textWidth(txt)-10, height/40 + 5 + textsize); 
  popStyle();
}

void drawLevelDipslay(){
  pushStyle();
  fill(color(255));
  textSize(textsize);
  txt = "Level: " + Integer.toString(level);
  text(txt, width-textWidth(txt)-width/70, height - textsize + 5); 
  popStyle();
}

void drawScoreDisplay(){
  pushStyle();
  fill(color(255));
  textSize(textsize);
  txt = "Score: " + Integer.toString(score);
  text(txt, width - textWidth(txt)-width/70 , height/40+5); 
  popStyle();
}

void drawHealthBar(){
  pushStyle();
  stroke(color(255), 100);
  noFill();
  rect(width/2-101, 15, 202, 40, 7);
  popStyle(); 
  pushStyle();
  fill(204, 102, 0);
  rect(width/2-100, 16, player.hp*2, 38, 7);
  popStyle();
  
  
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

void populateZombies(){
  if(zombiesinlevel == 0){
    if(level == 1){
      level++;
      zombiesinlevel = 15;
      spawnrate -= 300;
      createArrays();  
    }
    else if(level == 2){
      level++;  
      zombiesinlevel = 15;
      spawnrate -= 300;
      createArrays();
    }
    else if(level == 3){
      level++;  
      zombiesinlevel = 15;
      spawnrate -= 300;
      createArrays();
    }
    else if(level == 4){
      level++;  
      zombiesinlevel = 15;
      spawnrate -= 300;
      createArrays();
    } 
    else if(level == 5){
      level++;  
      zombiesinlevel = 15;
      spawnrate += 3000;
      createArrays();
    } 
  }
}


void createArrays(){  
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

