class BeingPlayer extends MassedBeing{

  
  private PImage character;
  private int x, y;
  private boolean left, right;
  private int char_size;
  
   BeingPlayer(int size){
     super(new HRectangle(width/2, height - height/5, size, size), new PVector(0,0), Float.POSITIVE_INFINITY, 1);   
     character = loadImage ("assets/hero.png");
     char_size = size;
   } 
   
   public void reset(){
     setPosition(x, y);
     setVelocityX(0);    
     setVelocityY(0);
   }
   
  public void update() {
    move();
  }
  
  public void move(){
    if(left && !right){
      _shape.getPosition().x -=4;
      _shape.getPosition().x = max(_shape.getPosition().x, 20);
    }else if(!left && right){
      _shape.getPosition().x +=4;
      _shape.getPosition().x = min(_shape.getPosition().x, width-20);
    }
  }
  
  public void receive(KeyMessage m){
    int code = m.getKeyChar();
    if(m.isPressed()){
      if(code =='A' || code == 'a'){
        left = true;
      } 
      else if(code =='D' || code == 'd'){
        right = true;
      } 
    }else{
      if(code =='A' || code == 'a'){
        left = false;
      } 
      else if(code =='D' || code == 'd'){
        right = false;
      }       
    }
  }
      
  void draw(){
//     fill(0);
//     _shape.draw();
    image (character, 0,0, char_size, char_size); 
   }
   
} 
