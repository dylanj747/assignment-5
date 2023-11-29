class Witch {
  States state;
  
  boolean shootKey = false;
  boolean leftKey = false;
  boolean rightKey = false;
  
  int facing = 1;
  boolean running = false;
  boolean shooting = false;
  
  float speed = 3;
  
  Witch() {
    state = States.IDLE; 
  }
    
  void display(){
    imageMode(CENTER);
    fill(0);
    switch(state) {
      case RUN:
      if(facing == -1){
        image(characters[4], 200, 250, 175, 210);
      } else {
      image(characters[5], 200, 250, 175, 210);
      }
      break;

    default:
      if(facing == -1){
        image(characters[2], 200, 250, 175, 210);
      } else {
      image(characters[3], 200, 250, 175, 210);
      }
      break;
    }
  }
  
  
   void input(){
    if (running){
      state = States.RUN;
    } else {
      state = States.IDLE;
    }
    
    if(shootKey){
      state = States.SHOOT;
    }
  }
  
  void move(){
  }


}
