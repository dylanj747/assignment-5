class EndScreen{
  
  
//displays end screen when game is over  
void display(){
  
  fill(0);
  rectMode(CENTER); 
  square(200, 200, 400);
  
  fill(255);
  textSize(35);
  text("Time's Up!", 125, 100);
  
  textSize(30);
  text("Score: ", 150, 130); //displays player's score
  text(orbCount, 235, 130);
  textSize(25);
  text("Press Shift to Restart", 100, 165); //instructions for new game
  
  //draws image of shift key
  rectMode(CENTER); 
  noFill();
  stroke(255);
  strokeWeight(2.5);
  h.rect(200, 200, 100, 30);
  h.line(200, 195, 200, 205);
  h.line(195, 200, 200, 195);
  h.line(205, 200, 200, 195);
}
  
}
