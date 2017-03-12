public class Equation{
  
  String eqString;
  int eqResult;
  
  int values [];
  int operator[]; // 1 = +, 2 = -, 3 = *
  
  public void generate(int difficulty){
    switch(difficulty){
      case 1:{
        this.operator = new int [1];
        this.operator[0] = (int) random(2)+1;
        this.values = new int [2];
        for(int i = 0; i < this.values.length; i++){
          this.values[i] = (int) random(1,50);
        }
      } break;
      case 2:{
        this.operator = new int [1];
        this.operator[0] = (int) random(2)+1;
        this.values = new int [2];
        for(int i = 0; i < this.values.length; i++){
          this.values[i] = (int) random(20,200);
        }
      } break;
      case 3:{
        this.operator = new int [2];
        this.operator[0] = (int) random(2)+1;
        this.operator[1] = (int) random(2)+1;
        this.values = new int [3];
        for(int i = 0; i < this.values.length; i++){
          this.values[i] = (int) random(1,50);
        }
      } break;
      case 4:{
        this.operator = new int [1];
        this.operator[0] = (int) random(2)+2;
        this.values = new int [2];
        for(int i = 0; i < this.values.length; i++){
          this.values[i] = (int) random(1,100);
        }
      } break;
      case 5:{
        this.operator = new int [2];
        this.operator[0] = (int) random(2)+2;
        this.operator[1] = (int) random(2)+1;
        this.values = new int [3];
        for(int i = 0; i < this.values.length; i++){
          this.values[i] = (int) random(1,50);
        }
      } break;
      case 6:{
        this.operator = new int [3];
        this.operator[0] = (int) random(3)+2;
        this.operator[1] = (int) random(2)+1;
        this.operator[2] = (int) random(2)+1;
        this.values = new int [4];
        for(int i = 0; i < this.values.length; i++){
          this.values[i] = (int) random(1,100);
        }
      } break;
    }
  }
  
  private void calculate(){
    this.eqResult = this.values[0];
    this.eqString ="";
    for(int i = 0; i < this.values.length; i++){
      if( i != this.values.length - 1 ){
        this.eqString = eqString.concat( Integer.toString(this.values[i]) ); 
        if(this.operator[i] == 1){
          this.eqString = this.eqString.concat(" + ");
          this.eqResult = this.eqResult + this.values[i+1];
        }
        else if(this.operator[i] == 2){
          this.eqString = this.eqString.concat(" - ");
          this.eqResult = this.eqResult - this.values[i+1];
        }
        else if(this.operator[i] == 3){
          this.eqString = this.eqString.concat(" * ");
          this.eqResult = this.eqResult * this.values[i+1];
        }
        else if(this.operator[i] == 4){
          this.eqString = this.eqString.concat(" / ");
          this.eqResult = (int) this.eqResult / this.values[i+1];
        }
      }
      else{
        this.eqString = this.eqString.concat( Integer.toString(this.values[i]));
      }
    }
  }
  
  public String equation(){
    return this.eqString;
  }
  
  public int result(){
    return this.eqResult;
  }
  
  
  public HashMap<String, Integer> nextEquation(int difficulty, int amount){
    HashMap<String,Integer> hm = new HashMap<String,Integer>();
    
    for(int i = 0; i < amount; i++){
      generate(difficulty);
      calculate();
      hm.put(this.eqString, this.eqResult);
    }
    
    return hm;
  }
}
