class Ghosts { //inventory skill 28

   
//PVector variables for ghosts
  PVector location;
  PVector velocity;
  PVector random = PVector.random2D(); //inventory skill 41 //random location for a ghost
  float speed = random(0.2, 1); //initial speed of ghosts


//calls on array from main class with x and y coordinates for ghosts locations
  Ghosts(float x, float y) { //inventory skills 28, 30
  location = new PVector(x, y); //inventory skill 29 //creates PVector coordinate locations
  velocity = new PVector(speed, 0); //creates PVector speed
  location.x = x;
  location.y = y;
  velocity.x = speed; //inventory skill 39 //velocity math for speed and location
}
 
//draws transparent ghosts
void display(){
  fill(255, 150);
  noStroke();
  arc(location.x + 50, location.y + 10, 60, 180, PI+HALF_PI, TWO_PI);
  arc(location.x + 50, location.y + 10, 60, 180, PI, PI+HALF_PI);
  arc(location.x + 50, location.y + 10, 20, 20, 0, PI);
  arc(location.x + 30, location.y + 10, 20, 20, 0, PI);
  arc(location.x + 70, location.y + 10, 20, 20, 0, PI);


}


//moves ghosts at different velocities
void move() { //inventory skill 35
  location.sub(velocity); //inventory skill 43 //subtracts location from the ghost's velocity
   if (location.x + 150 < 0) { //respawns ghosts on the right when they go past the left edge of the screen
     location.x = random(600, 1000); 
     location.y = random(0, 300);
     velocity.x = random(0.5, 1); //creates a new velocity within slow random constraints
    }
  }
}
