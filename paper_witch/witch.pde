class Witch {
  
//establishes states used in switch statement  
  States state;

//boolean to change state to shoot
  boolean shootKey = false;
  
//initial directions and states of images displayed  
  int facing = 1;
  boolean running = false;
  boolean shooting = false;
  boolean standingLeft = false;
  boolean standingRight = false;
  int isShooting = 4;

//float for speed witch moves at
  float speed = 4;
 
  
  Witch() {
    state = States.IDLEFRONT; //starting state is idle facing forward
  }

    
//switch statement to display the right character image based on movement      
  void display(){
    imageMode(CENTER);
    fill(0);
    switch(state) { //inventory skill 15
      case RUN: //if moving
      if(facing == -1){ //left is pressed
        image(characters.get(4), witchX, witchY, 175, 210); //inventory skills 10, 36 //gets the image location from the arrayList characters
      } else { //right is pressed
      image(characters.get(5), witchX, witchY, 175, 210);
      }
      break; //inventory skill 18 //stops case
      
      case IDLEFRONT: //if not moving
      if(facing == 2){ //down was just pressed
        image(characters.get(1), witchX, witchY, 175, 210);
      } else { //up was just pressed
      image(characters.get(0), witchX, witchY, 175, 210);
      }
      break;

      case IDLETURN: //please ignore. doesn't affect gameplay or code. not commented out because i will fix it. eventually.
      if(facing == -1){
        image(characters.get(2), witchX, witchY, 175, 210);
      } else {
      image(characters.get(3), witchX, witchY, 175, 210);
      }
      break;

      case SHOOT: //if space is pressed
      if(facing == -1 && isShooting == 4){ //left was just pressed
        image(characters.get(6), witchX, witchY, 175, 210);
      } else { //right was just pressed
      image(characters.get(7), witchX, witchY, 175, 210);
      }
      break;
    }
  }
  

//changes states based on input from main class keyPressed controls  
   void input(){
    if(running){ 
      state = States.RUN; //runs
    } else {
      state = States.IDLEFRONT; //default
    }
    
    if(shootKey){
      state = States.SHOOT; //shoots
    }
  }
  

//conditional statements that move the witch within the allowed area  
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


//reset variables when new game is started
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
