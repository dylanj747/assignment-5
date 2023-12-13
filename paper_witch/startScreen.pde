class StartScreen{
  
 
//displays the start game screen with instructions  
void display(){ 
  fill(255);
  textSize(16);
  text("Blast as many orbs as you can", 101, 30);
  text("before the time runs out!", 114, 50);
  
  textSize(20);
  text("Use WASD to move and", 105, 90);
  text("press space to blast", 115, 110);
  
  textSize(35);
  fill(0);
  text("Press Enter To Start", 52, 160);
  fill(255);
  textSize(35);
  text("Press Enter To Start", 55, 160);
  
  //draws enter button
  rectMode(CENTER); 
  noFill();
  stroke(255);
  strokeWeight(2.5);
  h.rect(200, 200, 100, 30);
  h.line(170, 200, 230, 200);
  h.line(175, 195, 170, 200);
  h.line(175, 205, 170, 200);
  h.line(230, 195, 230, 200);
} 
}
