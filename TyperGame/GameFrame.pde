class GameFrame extends Being {
  private Button score_panel, streak_panel, answer_panel;
  
  GameFrame(IScreen parent){
    super(new HRectangle(0,0,width, 70));
    score_panel  = new Button(new HRectangle(WINDOW_WIDTH - 120, 30, 110, 25), "Score : ", parent);
  }
  
  public void draw() {}
}
