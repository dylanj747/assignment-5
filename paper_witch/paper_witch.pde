/*
Paper Witch
Dylan Johnson, 11/15/23  
Use the wasd keys to move the witch around the screen.
Press space to cast spells and blast as many orbs as possible before time runs out!
*/

/* this is not an in class exercise or previously written code. It is a library. From the internet. That I learned about after milestone 2. And fit my initial plan.
Referenced Library: Handy (Lines 16-17)
Description: Creates Processing sketches using a hand-drawn style 
Authors: Jo Wood and Aidan Slingsby
Date: December 4, 2023
URL: https://www.gicentre.net/handy/using
*/

  import org.gicentre.handy.*; //sketchy theme
  HandyRenderer h;
  


//establish array for background ghosts
  Ghost[] ghost = new Ghost[4]; //inventory skill 33
  
//establish arrayList for sprite sheet
  ArrayList <PImage> characters; //inventory skill 34
 
//establish 4 states for character/sprite movement   
  enum States {IDLEFRONT, IDLETURN, RUN, SHOOT}
  
//establish classes
  Witch witch; //character display and movement
  
  Orb orb; //orb display and mechanics
  
  Blast blast; //collision display and mechanics
  
  StartScreen startScreen; //start state
  
  EndScreen endScreen; //end state
  
//character movement booleans
  boolean moveUp = false;
  boolean moveDown = false;
  boolean moveRight = false;
  boolean moveLeft = false;

//blast boolean 
  boolean shoot = false;

//witch location on screen 
  float witchX = 200; //inventory skill 10
  float witchY = 250;

//orb location on screen 
  float orbX = random(20, 380); //spawns at a random location within the area the witch can move
  float orbY = random(150, 300);
  float diameter = 5; //orb diameter
  int orbCount = 0; //score starts at 0

//character direction booleans used in sprite movement switch statement  
  boolean facingLeft = false;
  boolean facingRight = false;

//game state booleans
  boolean play = false;
  boolean gameOver = false;

//timer ints
  int numSeconds = 60; //number of seconds on timer
  int startTime; //time timer started at
  int timePassed; //time elapsed since start
  
  int seed; //see line 116 (used to control render filter jitter)

//function takes float values and calculates the distance between the witch location and the orb
  float distance(float x1, float y1, float x2, float y2){ //inventory skills 23, 40
  float XDistance = x2 - x1; //math
  float YDistance = y2 - y1;
  return sqrt(sq(XDistance) + sq(YDistance)); //inventory skill 21 //returns the square root of the distances squared and added
}
  

void setup(){ //inventory skill 4
  size(400, 400);
  frameRate(60); //keeps smooth
  h = new HandyRenderer(this); //sketchy render established
  
//loop the ghosts across the screen in an array
  for (int i = 0; i < ghost.length; i++) { //inventory skill 33 //uses a loop to traverse the ghost array
    ghost[i]= new Ghost(random(-100, width + 200), random(0, 250)); //regenerates ghosts at random locations off-screen
}

//creates the characters arraylist that stores sprite images
  characters = new ArrayList <PImage>(); //inventory skills 34, 48
  
  characters.add(loadImage("idle front.png")); //idle front
  characters.add(loadImage("idle back.png")); //idle back
  characters.add(loadImage("idle left.png")); //idle left
  characters.add(loadImage("idle right.png")); //idle right
  characters.add(loadImage("run left.png")); //run left
  characters.add(loadImage("run right.png")); //run right
  characters.add(loadImage("blast left.png")); //blast left
  characters.add(loadImage("blast right.png")); //run right

//instantiates class objects
  witch = new Witch();
  orb = new Orb();
  blast = new Blast();
  startScreen = new StartScreen();
  endScreen = new EndScreen();
}
  
  
void draw(){
  background(0); //inventory skill 5
  rectMode(CORNERS); //inventory skill 3
  ellipseMode(CENTER);
  
/* this edits the library, that I found after milestone 2, that followed my initial plan. It is not in the first commit, because it didn't exist before the first commit. It was published after the second.
Referenced Conditional Statement: Stopping the jitter (Lines 115-119)
Description: Changes the jitter effect of the Handy function
Author: Kit Barry
Date: December 4, 2023
Location: Programming Fundamentals - Week 12, slide 19
*/
  h.setSeed(seed);
  if(frameCount % 10 == 0) {
    seed += 1;
    seed = seed % 10;
  }
  
//draw and move ghosts in the backgound
  for (int i = 0; i < ghost.length; i++) { //inventory skill 16
    ghost[i].display(); //displays ghosts from ghost class
    for(int j = 0; j < 1; j ++){ //inventory skill 17 //allows me to adjust the overall speed of the ghosts
      ghost[i].move(); //calls move ghost method from ghost class   
      } 
   }
      
  //draw hallway
  noStroke(); //inventory skill 2
  fill(255);
  quad(0, 0, 100, 0, 100, 250, 0, 400); //inventory skill 1
  quad(400, 0, 300, 0, 300, 250, 400, 400);
  fill(50);  
  quad(100, 250, 300, 250, 400, 400, 0, 400);
  
  quad(0, 20, 40, 35, 40, 175, 0, 200);
  quad(50, 40, 80, 50, 80, 150, 50, 170);
  quad(320, 50, 350, 40, 350, 170, 320, 150);
  quad(360, 35, 400, 20, 400, 200, 360, 175);
  
  noFill();
  stroke(0);
  h.quad(0, 0, 100, 0, 100, 250, 0, 400);
  h.quad(400, 0, 300, 0, 300, 250, 400, 400);
  h.quad(100, 250, 300, 250, 400, 400, 0, 400);
  
  h.quad(0, 20, 40, 35, 40, 175, 0, 200);
  h.quad(50, 40, 80, 50, 80, 150, 50, 170);
  h.quad(320, 50, 350, 40, 350, 170, 320, 150);
  h.quad(360, 35, 400, 20, 400, 200, 360, 175);
  
//runs timer when the game is in play  
  if(play == true && gameOver == false){ //inventory skills 12, 13, 14
    timePassed = (millis() - startTime) / 1000; //rounds the miliseconds to seconds
    int remainingTime = numSeconds - timePassed; //inventory skills 9, 44 //time counts down from the time passed (60)
    
    if (remainingTime >=0) { //inventory skill 9 //displays the time left on timer on screen
    fill(0);
    textSize(15);
    text("Time Left:", 3, 15);
    textSize(18);
    text(remainingTime, 70, 15);
    textSize(15);
    text("s", 90, 15);
  }
  
  
  //float witchDistance = distance(witchX, witchY, orbX, orbY);
  //println("Witch and orb distance: " + witchDistance); used to find collision boundary values used in blast

//calls functions from other classes    
  witch.input();
  witch.display();
  witch.move();
  
  orb.display();

  if (shoot == true){ //calls collision detector if player shoots(spacebar)
  blast.shoot();
  }
  
  blast.collision();

//ends the game when the timer hits 0  
  if(remainingTime <= 0){
     gameOver = true;
   }
 }
   else if (gameOver == true) { //displays the end screen with score when game ends
     endScreen.display();
     if(keyPressed && key == CODED && keyCode == SHIFT){ //resets the game variables when shift is pressed
       reset();
     }
   }
   else {
     startScreen.display(); //displays the start screen when game is not in play and not over
   }
}


//retets game variables at the start of every game
void reset() { //inventory skill 20
  moveUp = false;
  moveDown = false;
  moveRight = false;
  moveLeft = false;
  shoot = false;
  witchX = 200;
  witchY = 250;
  orbX = random(20, 380);
  orbY = random(150, 300);
  orbCount = 0;
  facingLeft = false;
  facingRight = false;
  play = false;
  gameOver = false;
  numSeconds = 60;

//resets variables in other classes  
  witch.reset();
  blast.reset();
}


//witch movement controls when key is pressed for general movement and switch statement to display the correct image
void keyPressed(){ //inventory skill 7
  if (key == 'w'){
   moveDown = true;
   witch.facing = 2; //direction
   
  }
  if (key == 'a'){
    moveLeft = true;
    witch.facing = -1; 
    witch.running = true; //changes state from idle to run
    facingLeft = true;
    facingRight = false;
  }
  if (key == 's'){
    moveUp = true;
    witch.facing = 3;
  }
  if (key == 'd'){
    moveRight = true;
    witch.facing = 1; 
    witch.running = true;
    facingRight = true;
    facingLeft = false;
  }
  if (key ==' '){
    witch.shootKey = true;
    witch.isShooting = 4; //changes state from idle or running to shooting
    shoot = true; //carries out blast function
  }
  if (key == ENTER){
      play = true;
      startTime = millis(); //resets the timer when the game starts 
  }  
}


//witch movement controls when key is released for general movement and changing sprites
void keyReleased(){
  if(key == 'w'){
    moveDown = false;
  }
  if(key == 'a'){
    moveLeft = false;
    witch.running = false;
    witch.standingLeft = true;
  }
  if(key == 's'){
    moveUp = false;
  }
  if(key == 'd'){
    moveRight = false;
    witch.running = false;
    witch.standingRight = true; 
   }
  if(key == ' '){
    witch.shooting = false;
    witch.shootKey = false;
    shoot = false;
    diameter = 5;
  }
}
