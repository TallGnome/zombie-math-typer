class ScreenWelcome implements IScreen{
 private PImage background;
 private Button startButton;
 private Button exitButton;
 private Button optionsButton;
 

 

  ScreenWelcome() {
    background = loadImage ("assets/welcome.jpg");
    startButton  = new Button(new HRectangle(WINDOW_WIDTH/2-75, WINDOW_HEIGHT/2-50, 150, 30), "Start Game", this);
    exitButton  = new Button(new HRectangle(WINDOW_WIDTH/2-75, WINDOW_HEIGHT/2, 150, 30), "Exit", this);
    optionsButton  = new Button(new HRectangle(WINDOW_WIDTH/2-75, WINDOW_HEIGHT/2+50, 150, 30), "Options", this);
  }

//When the screen is activated, it informs the world about its beings
  public void activateScreen(){
    world.register(startButton);
    world.subscribe(startButton, POCodes.Button.LEFT, startButton.getShape());
    world.register(exitButton);
    world.subscribe(exitButton, POCodes.Button.LEFT, exitButton.getShape());
    world.register(optionsButton);
    world.subscribe(optionsButton, POCodes.Button.LEFT, optionsButton.getShape());    
  }

//When the screen is deactivated it deletes its being from the world
  public void deactivateScreen(){
    world.getPostOffice().resetSubscriptions();    
    world.delete(startButton);
    world.delete(exitButton);
    world.delete(optionsButton);    
  }

// Tells the world to change to another screen
  public void alert(Being b){
    if(b==startButton){
      world.changeState(GAME); //You need to implement this at the world
    }else if(b==exitButton){
      exit();
    }else if(b==optionsButton){
      world.changeState(OPTIONS);
    }
  } 
  
  public String toString(){
    return "Credits screen";  
  }

  void draw() {
    background.resize(800, 640);
    image (background, 0,0); 
  }
}
