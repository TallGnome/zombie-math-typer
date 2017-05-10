class GameFrame extends Being {
  private Button score_panel, streak_panel, answer_panel;
  private int _width = width;
  private int _height = 80;
  GameFrame(IScreen parent){
    super(new HRectangle(0,0,width, 80));
    score_panel  = new Button(new HRectangle(this._width - 120, 30, 110, 25), "Score : ", parent);
  }
  
  public void draw() {
    stroke(0);
    fill(225);
    score_panel.draw();
  }
}
