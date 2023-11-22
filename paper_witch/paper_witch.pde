/*
Paper Witch
Dylan Johnson, 11/15/23  
Use the wasd keys to move the witch around the screen.
Press space to cast spells and blast the glowing orbs!
*/

//entablish array and class for multiple clouds
  Ghosts[] ghosts = new Ghosts[4];
  PImage img;
  PImage img2;
  PImage img3;
  PImage img4;
  PImage img5;



void setup(){
  size(400, 400);
  frameRate(60); //keep the framerate smooth
  
   //loop the clouds across the screen
  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i]= new Ghosts (random(-100, width + 200), random(0, 300)); //regenerate clouds at random locations off-screen
  }
  
  img = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");

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
  
  imageMode(CENTER);
  
  image(img, 200, 250, 175, 210);
  image(img2, 200, 250, 175, 210);
  image(img3, 200, 250, 175, 210);
  image(img4, 200, 250, 175, 210);
  image(img5, 200, 250, 175, 210);




}
