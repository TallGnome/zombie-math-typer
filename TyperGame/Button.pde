class Button extends Being {
  String _text;
  IScreen _owner;
  
  Button(HShape shape, String text, IScreen s) {
    super(shape);
    _text = text;
    _owner = s;
  }

  //Method that recieves a message from the Post office and alerts the owner
  //Works if the Button is subscribed to the specific POCode when it is registerd to the world
  public void receive(MouseMessage m) {
    if (m.getAction() == POCodes.Click.PRESSED) {
      _owner.alert(this);
    }
  } 

  public void draw() {
      stroke(0);
      if(_shape.contains(mouseX, mouseY)){ //_shape is an attribute of being. See API
        fill(activeColor);  //defined at the HockeyPongLab 
      }else{
        fill(buttonColor); //defined at the HockeyPongLab 
      } 
      _shape.draw();
      fill(0);
      textSize(16);
      text(_text, 10, 15); //text is drawn in relation to the shapes origin.
  }
}
