class Blast {
  
//collision detector boolean  
  boolean isCollision = false;
 

//daws the spell on the witch's wand when space is pressed  
void shoot(){
  fill(255, 175);
  stroke(220, 200);
  strokeWeight(12);
  
  if(diameter < 50){ //expanding glowing ball for spell(looks cool)
    if(facingLeft == true){ //draws spell depending on which way the witch is facing
    circle(witchX-82, witchY+1, diameter++); //expands diameter until 50 at the wand location
    }
    if(facingRight == true){
    circle(witchX+78, witchY+3, diameter++);
    }
  }
}


//detects spell/blast and orb collision
void collision(){ //inventory skill 49
  if(facingLeft == true && shoot == true){ //checks for collision when facing left
    if(witchX-82+20 >= orbX-10 && witchX-82-20 <= orbX+10 //do locations match?
     && witchY+1+20 >= orbY-10 && witchY+1-20 <= orbY+10){
       orbX = random(20, 380); //resets orb location
       orbY = random(150, 300);
       orbCount++; //inventory skill 8//increases score if collison is detected
       println("Blast!"); //inventory skill 11 //debug checks for collision and prints message
     }
   }
    if(facingRight == true && shoot == true){ //checks for collision when facing right
    if(witchX+78+20 >= orbX-10 && witchX+78-20 <= orbX+10
     && witchY+3+20 >= orbY-10 && witchY+3-20 <= orbY+10){
       orbX = random(20, 380);
       orbY = random(150, 300);
       orbCount++;
       println("Blast!");
     }
   }
   
 }
 
 
//resets collision detector condidional for new game 
void reset(){
  isCollision = false;
}
}
