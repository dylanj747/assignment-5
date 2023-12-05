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
    switch(state) { //inventory skill 15
      case RUN:
      if(facing == -1){
        image(characters.get(4), witchX, witchY, 175, 210); //inventory skills 10, 36
      } else {
      image(characters.get(5), witchX, witchY, 175, 210);
      }
      break;  //inventory skill 18
      
      case IDLEFRONT:
      if(facing == 2){
        image(characters.get(1), witchX, witchY, 175, 210);
      } else {
      image(characters.get(0), witchX, witchY, 175, 210);
      }
      break;
      //make case work
      case IDLETURN:
      if(facing == -1){
        image(characters.get(2), witchX, witchY, 175, 210);
      } else {
      image(characters.get(3), witchX, witchY, 175, 210);
      }
      break;
        //fix shoot so right isnt default   
      case SHOOT:
      if(facing == -1 && isShooting == 4){
        image(characters.get(6), witchX, witchY, 175, 210);
      } else {
      image(characters.get(7), witchX, witchY, 175, 210);
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
  if (moveRight == true && witchX <= 300){ //constrains witch location to the screen width on the left 
    witchX = constrain(witchX + speed, 0, 300); //inventory skill 6 //moves witch right at a speed of 3
    }
  if (moveLeft == true && witchX >= 100 ){ //constrains witch location to the screen width on the right
    witchX = constrain(witchX - speed, 100, width); //moves witch left at a speed of 3
    }
  if (moveUp == true && witchY <= 300){ //constrains witch location to the screen height on the bottom 
    witchY = constrain(witchY + speed, 0, 300); //moves witch right at a speed of 3
    }
  if (moveDown == true && witchY >= 175){ //constrains witch location to the screen height on the top
    witchY = constrain(witchY - speed, 175, height); //moves witch left at a speed of 3
    }
  }

void reset(){
  shootKey = false;
  facing = 1;
  running = false;
  shooting = false;
  standingLeft = false;
  standingRight = false;
  isShooting = 4;
  speed = 4;
}

}
