class Orb {
  

//draws the glowing orb
void display(){
  fill(255);
  stroke(200, 200);
  strokeWeight(6);
  
  circle(orbX, orbY, 20 + 10*sin(frameCount*.05)); //orb pulsates
} 
}
