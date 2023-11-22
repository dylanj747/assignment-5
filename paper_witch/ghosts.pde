class Ghosts {

   
  //cloud specific PVector variables
  PVector location;
  PVector velocity;
  float speed = random(0.2, 1); //slow speed of clouds


  //calls on array from main class with x and y coordinates for cloud locations
  Ghosts(float x, float y) {
  location = new PVector(x, y); //creates PVector coordinate locations
  velocity = new PVector(speed, 0); //creates PVector speed
  location.x = x;
  location.y = y;
  velocity.x = speed; //velocity math for speed and location
}
 
 
void display(){ //draws translucent clouds with moving locations
  fill(255, 150);
  noStroke();
  arc(location.x + 50, location.y + 10, 60, 180, PI+HALF_PI, TWO_PI);
  arc(location.x + 50, location.y + 10, 60, 180, PI, PI+HALF_PI);
  arc(location.x + 50, location.y + 10, 20, 20, 0, PI);
  arc(location.x + 30, location.y + 10, 20, 20, 0, PI);
  arc(location.x + 70, location.y + 10, 20, 20, 0, PI);


}


void move() { //moves clouds with varying velocities
  location.sub(velocity);
   if (location.x + 150 < 0) { //respawns clouds on the right when they go past the left edge of the screen
     location.x = random(600, 1000);
     location.y = random(0, 300);
     velocity.x = random(0.5, 1); //creates a new velocity within slow random constraints
    }
  }
}
