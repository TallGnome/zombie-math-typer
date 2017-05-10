class ScreenGame implements IScreen{
  
  private BeingPlayer hero; 
  private ArrayList<BeingZombie> zombies;
  private GameFrame game_frame;
  
  ScreenGame() {
    hero = new BeingPlayer(PLAYERSIZE);
    game_frame = new GameFrame(this);
    zombies = new ArrayList<BeingZombie>();
    zombies.add(new BeingZombie(35, 60, 1, "wtf", 3));
    zombies.add(new BeingZombie(120, 40, 1, "wtf mate", 4));
    zombies.add(new BeingZombie(320, 40, 1, "gg", 7));
    
  }
  
  public void activateScreen(){
    for(int i = 0; i < zombies.size(); i++){
      world.register(this.zombies.get(i));
    }
    world.register(game_frame);

    world.register(hero);
    world.subscribe(hero, POCodes.Key.A);
    world.subscribe(hero, POCodes.Key.D);
  }
  
  public void deactivateScreen(){
    world.getPostOffice().resetSubscriptions();    
    world.delete(hero);
    for(int i = 0; i < zombies.size(); i++){
      world.delete(this.zombies.get(i));
    }
    world.delete(game_frame);
  }
  
  public void alert(Being b){}
  
  public String toString(){
    return "Main Game Screen";
  }
  
  void draw() {
    background(000);
    for(int i = 0; i < this.zombies.size(); i++){
      if(this.zombies.get(i).toRemove()){
        world.delete(this.zombies.get(i));
      }
    }
    
    currtime = millis();

    if (currtime - starttime >= spawnrate)
    {
      zombiesinlevel--;
//      BeingZombie newzombie = new BeingZombie(35, 60, level, equations[iterator], results[iterator]);
BeingZombie newzombie = new BeingZombie(35, 60, level, "lmao", 5);
      zombies.add(newzombie);
      starttime = currtime;
      iterator++;
    }
  }
}
