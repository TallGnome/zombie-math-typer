class ZombieWorld extends World {
    private int currentState;
    private IScreen[] screen;
        
  ZombieWorld() {
    screen = new IScreen [4];
    screen[CREDITS] = new ScreenCredits();
    screen[WELCOME] = new ScreenWelcome();
    screen[OPTIONS] = new ScreenOptions();
    screen[GAME] = new ScreenGame();
    currentState = WELCOME; 
  }
  
  void setup(){
    screen[currentState].activateScreen(); 
  }

  void draw(){
    screen[currentState].draw();
    super.draw();                
  }
  
  void reset(){
    
  }
  
  public void changeState(int newState){
    screen[currentState].deactivateScreen();
    currentState = newState;
    screen[currentState].activateScreen();    
  }

 
   public void endGame(){
     exit();    
   } 
}
