class Ghost { //inventory skill 28

   
//PVector variables for ghosts
  PVector location;
  PVector acceleration;
  PVector random = PVector.random2D(); //inventory skill 41 //random location for a ghost
  float ghostSpeed = random(0.25, 1); //initial speed of ghosts


//calls on array from main class with x and y coordinates for ghosts locations
  Ghost(float x, float y) { //inventory skills 28, 30
  location = new PVector(x, y); //inventory skill 29 //creates PVector coordinate locations
  acceleration = new PVector(ghostSpeed, 0); //creates PVector speed
  
  location.x = x;
  location.y = y;
  acceleration.x = ghostSpeed; //inventory skill 39 //accelerration calculation
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


//moves ghosts at different accelerations
void move() { //inventory skill 35
  location.add(acceleration); //inventory skill 43 //adds onto the ghost's location, accelerating it
   if (location.x + 175 > 500) { //respawns ghosts on the left when they go past the right edge of the screen
     location.x = random(-1000, -500); //creates distance between spawns
     location.y = random(0, 300);
     acceleration.x = random(0.7, 1.2); //resets acceleration within a slow constrained speed
    }
  }
}
