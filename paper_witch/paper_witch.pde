/*
Paper Witch
Dylan Johnson, 11/15/23  
Use the wasd keys to move the witch around the screen.
Press space to cast spells and blast as many orbs as possible before time runs out!
*/

/*
Referenced Library: Handy 
Description: Creates Processing sketches using a hand-drawn style
Authors: Jo Wood and Aidan Slingsby
Date: December 4, 2023
URL: https://www.gicentre.net/handy/using
*/
//inventory skill 21
//inventory skill 23
//inventory skill 24

  import org.gicentre.handy.*;
  HandyRenderer h;
  



//entablish array and class for multiple clouds
  Ghosts[] ghosts = new Ghosts[4]; //inventory skill 33
  ArrayList <PImage> characters; //inventory skill 34
  
  enum States {IDLEFRONT, IDLETURN, RUN, SHOOT}
  Witch witch;
  
  Orb orb;
  
  Blast blast;
  
  StartScreen startScreen;
  
  EndScreen endScreen;
  
  boolean moveUp = false;
  boolean moveDown = false;
  boolean moveRight = false;
  boolean moveLeft = false;
  
  boolean shoot = false;
  
  float witchX = 200; //inventory skill 10
  float witchY = 250;
  
  float orbX = random(20, 380);
  float orbY = random(150, 300);
  float diameter = 5; 
  int orbCount = 0;

  
  boolean facingLeft = false;
  boolean facingRight = false;
  
  boolean play = false;
  boolean gameOver = false;
  
  int numSeconds = 65;
  int rate = 60;
  int frames = numSeconds * rate;
  
  int seed;
  

void setup(){ //inventory skill 4
  size(400, 400);
  frameRate(rate);
  h = new HandyRenderer(this);
  
   //loop the ghosts across the screen
  for (int i = 0; i < ghosts.length; i++) { //inventory skill 33
    ghosts[i]= new Ghosts (random(-100, width + 200), random(0, 250)); //regenerate clouds at random locations off-screen
}
  
  characters = new ArrayList <PImage>(); //inventory skills 34, 48
  
  characters.add(loadImage("idle front.png")); //idle front
  characters.add(loadImage("idle back.png")); //idle back
  characters.add(loadImage("idle left.png")); //idle left
  characters.add(loadImage("idle right.png")); //idle right
  characters.add(loadImage("run left.png")); //run left
  characters.add(loadImage("run right.png")); //run right
  characters.add(loadImage("blast left.png")); //blast left
  characters.add(loadImage("blast right.png")); //run right


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
  
/*
Referenced Conditional Statement: Stopping the jitter 
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
  
  //draw and move clouds in the backgound
  for (int i = 0; i < ghosts.length; i++) { //inventory skill 16
    ghosts[i].display(); //displays clouds from cloud class
    for(int j = 0; j < 1; j ++){ //inventory skill 17 //allows me to adjust the overall speed of the ghosts
      ghosts[i].move(); //calls move cloud method from clouds class   
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
  
  
  if(play == true && gameOver == false){ //inventory skills 12, 13, 14
    int seconds = (frames - frameCount) / rate; //inventory skills 9, 44
    if (seconds >=0) { //inventory skill 9
    fill(0);
    textSize(15);
    text("Time Left:", 3, 15);
    textSize(18);
    text(seconds, 70, 15);
    textSize(15);
    text("s", 90, 15);
  }
    
  witch.input();
  witch.display();
  witch.move();
  
  orb.display();

  if (shoot == true){
  blast.shoot();
  }
  blast.collision();
  
  if(seconds <= 0){
     gameOver = true;
   }
 }
   else if (gameOver == true) {
     endScreen.display();
     if(keyPressed && key == CODED && keyCode == SHIFT){
       reset();
     }
   }
   else {
     startScreen.display();
   }
   
}


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
  numSeconds = 65;
  rate = 60;
  frames = numSeconds * rate;
  
  witch.reset();
  blast.reset();
}


void keyPressed(){ //inventory skill 7
  if (key == 'w'){
   moveDown = true;
   witch.facing = 2;
   
  }
  if (key == 'a'){
    moveLeft = true;
    witch.facing = -1; 
    witch.running = true;
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
    witch.isShooting = 4;
    shoot = true;
  }
  if (key == ENTER){
      play = true;
  }
}


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
