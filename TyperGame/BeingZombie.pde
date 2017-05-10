class BeingZombie extends MassedBeing{

  
  private PImage character;
  private int x, y, solution, speed, txtSize, level, damage;
  private boolean left, right;
  private int char_size;
  private String equation;
  
   BeingZombie(int x, int size, int lvl, String eq, int result){
     super(new HRectangle(x, 0, size, size), new PVector(0,0), Float.POSITIVE_INFINITY, 1);   
     character = loadImage ("assets/zombie.png");
     char_size = size;
     this.x = x;
     this.level = lvl;
     this.equation = eq;
     this.solution = result;
     this.y = 0;
     this.speed = getSpeed(this.level);
     
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
      _shape.getPosition().x -=2;
      _shape.getPosition().x = max(_shape.getPosition().x, 20);
    }else if(!left && right){
      _shape.getPosition().x +=2;
      _shape.getPosition().x = min(_shape.getPosition().x, width-20);
    }
    _shape.getPosition().y +=this.speed;
  }
      
  void draw(){
//     fill(0);
//     _shape.draw();
    image (character, 0,0, char_size, char_size); 
   }
   
   int getSpeed(int lvl)
  {
    int sp = 0;
    switch (lvl)
    {
      case 1:
      { 
        sp = (int) random(1,2);
      } 
      break;
      case 2:
      { 
        sp = (int) random(1,3);
      } 
      break;
      case 3:
      { 
        sp = (int) random(2,5);
      } 
      break;  
      default: 
        break;
    }
    return sp;
  }
  
   
} 
