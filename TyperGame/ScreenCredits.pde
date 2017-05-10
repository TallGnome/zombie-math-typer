class ScreenCredits implements IScreen{
 private PImage background;
 private Button backToOptionsButton;
 
  ScreenCredits() {
    background = loadImage ("assets/welcome.jpg");
    backToOptionsButton  = new Button(new HRectangle(3*WINDOW_WIDTH/4, 3*WINDOW_HEIGHT/4, 150, 30), "Back", this);
  }

//When the screen is activated, it informs the world about its beings
  public void activateScreen(){
    world.register(backToOptionsButton);
    world.subscribe(backToOptionsButton, POCodes.Button.LEFT, backToOptionsButton.getShape());
  }

//When the screen is deactivated it deletes its being from the world
  public void deactivateScreen(){
    world.getPostOffice().resetSubscriptions();    
    world.delete(backToOptionsButton);
  }

// Tells the world to change to another screen
  public void alert(Being b){
    if(b==backToOptionsButton){
      world.changeState(OPTIONS); //You need to implement this at the world
    }
  } 
  
  public String toString(){
    return "Credits screen";  
  }

  void draw() {
    image (background, 0,0); 
  }
}
