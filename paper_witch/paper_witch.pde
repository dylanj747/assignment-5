/*
Paper Witch
Dylan Johnson, 11/15/23  
Use the wasd keys to move the witch around the screen.
Press space to cast spells and blast the glowing orbs!
*/

//entablish array and class for multiple clouds
  Ghosts[] ghosts = new Ghosts[4];
  PImage[] characters;
  
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
  
  float witchX = 200;
  float witchY = 250;
  
  float orbX = random(20, 380);
  float orbY = random(150, 300);
  float diameter = 5; 
  float orbCount = 0;

  
  boolean facingLeft = false;
  boolean facingRight = false;
  
  boolean play = false;
  boolean gameOver = false;

  

void setup(){
  size(400, 400);
  frameRate(60); //keep the framerate smooth
  
   //loop the clouds across the screen
  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i]= new Ghosts (random(-100, width + 200), random(0, 250)); //regenerate clouds at random locations off-screen
  }
  
  characters = new PImage[8];
  
  characters[0] = loadImage("idle front.png"); //idle front
  characters[1] = loadImage("idle back.png"); //idle back
  characters[2] = loadImage("idle left.png"); //idle left
  characters[3] = loadImage("idle right.png"); //idle right
  characters[4] = loadImage("run left.png"); //run left
  characters[5] = loadImage("run right.png"); //run right
  characters[6] = loadImage("blast left.png"); //blast left
  characters[7] = loadImage("blast right.png"); //run right


  witch = new Witch();
  orb = new Orb();
  blast = new Blast();
  startScreen = new StartScreen();
  endScreen = new EndScreen();
}
  
void draw(){
  background(0);
  noStroke();
  rectMode(CORNERS); 
  ellipseMode(CENTER);
  
  //draw and move clouds in the backgound
  for (int i = 0; i < ghosts.length; i++) {
  ghosts[i].move(); //calls move cloud method from clouds class   
  ghosts[i].display(); //displays clouds from cloud class
   }
   
  //draw hallway
  fill(255);
  quad(0, 0, 100, 0, 100, 250, 0, 400);
  quad(400, 0, 300, 0, 300, 250, 400, 400);
  fill(50);  
  quad(100, 250, 300, 250, 400, 400, 0, 400);
  
  quad(0, 20, 40, 35, 40, 175, 0, 200);
  quad(50, 40, 80, 50, 80, 150, 50, 170);
  quad(320, 50, 350, 40, 350, 170, 320, 150);
  quad(360, 35, 400, 20, 400, 200, 360, 175);
  
  
  if(play == true){
    
  witch.input();
  witch.display();
  witch.move();
  
  orb.display();

  if (shoot == true){
  blast.shoot();
  }
  blast.collision();
  
   }
   else {
     startScreen.display();
   }
   
   if (play == true && gameOver == true) {
     endScreen.display();
   }
}

void keyPressed(){
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
