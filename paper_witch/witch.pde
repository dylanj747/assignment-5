class Witch {
  States state;
  
  boolean shootKey = false;
  
  int facing = 1;
  boolean running = false;
  boolean shooting = false;
  boolean standingLeft = false;
  boolean standingRight = false;
  int isShooting = 4;
  
  float speed = 4;
  
  Witch() {
    state = States.IDLEFRONT; 
  }
    
  void display(){
    imageMode(CENTER);
    fill(0);
    switch(state) {
      case RUN:
      if(facing == -1){
        image(characters[4], witchX, witchY, 175, 210);
      } else {
      image(characters[5], witchX, witchY, 175, 210);
      }
      break;  
      
      case IDLEFRONT:
      if(facing == 2){
        image(characters[1], witchX, witchY, 175, 210);
      } else {
      image(characters[0], witchX, witchY, 175, 210);
      }
      break;
      //make case work
      case IDLETURN:
      if(facing == -1){
        image(characters[2], witchX, witchY, 175, 210);
      } else {
      image(characters[3], witchX, witchY, 175, 210);
      }
      break;
        //fix shoot so right isnt default   
      case SHOOT:
      if(facing == -1 && isShooting == 4){
        image(characters[6], witchX, witchY, 175, 210);
      } else {
      image(characters[7], witchX, witchY, 175, 210);
      }
      break;
    }
  }
  
  
   void input(){
    if(running){
      state = States.RUN;
    } else {
      state = States.IDLEFRONT;
    }
    
    if(shootKey){
      state = States.SHOOT;
    }
  }
  
  
  void move(){
    if (witchX <= 300){ //constrains witch location to the screen width on the left 
    if (moveRight == true) {
      witchX = witchX + speed; //moves witch right at a speed of 3
    }
  }
  if (witchX >= 100 ){ //constrains witch location to the screen width on the right
    if (moveLeft == true) {
      witchX = witchX - speed; //moves witch left at a speed of 3
     }
   }
   if (witchY <= 300){ //constrains witch location to the screen height on the bottom 
    if (moveUp == true) {
      witchY = witchY + speed; //moves witch right at a speed of 3
    }
  }
  if (witchY >= 175 ){ //constrains witch location to the screen height on the top
    if (moveDown == true) {
      witchY = witchY - speed; //moves witch left at a speed of 3
     }
   }
  }


}
