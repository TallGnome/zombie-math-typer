class ScreenGame implements IScreen{
  
  private BeingPlayer hero; 
  private ArrayList<BeingZombie> zombies;
  
  ScreenGame() {
    hero = new BeingPlayer(PLAYERSIZE);
    zombies = new ArrayList<BeingZombie>();
    zombies.add(new BeingZombie(35, 60, 1, "wtf", 3));
    zombies.add(new BeingZombie(120, 40, 1, "wtf mate", 4));
    zombies.add(new BeingZombie(320, 40, 1, "gg", 7));
  }
  
  public void activateScreen(){
    for(int i = 0; i < zombies.size(); i++){
      world.register(zombies.get(i));
    }
    world.register(hero);
    world.subscribe(hero, POCodes.Key.A);
    world.subscribe(hero, POCodes.Key.D);
  }
  
  public void deactivateScreen(){
    world.getPostOffice().resetSubscriptions();    
    world.delete(hero);
    for(int i = 0; i < zombies.size(); i++){
      world.delete(zombies.get(i));
    }
  }
  
  public void alert(Being b){}
  
  public String toString(){
    return "Main Game Screen";
  }
  
  void draw() {
    background(000);
  }
}
