class Blast {
  
  boolean isCollision = false;
  
void shoot(){
  fill(255, 175);
  stroke(220, 200);
  strokeWeight(12);
  
  if(diameter < 50){
    if(facingLeft == true){
    circle(witchX-82, witchY+1, diameter++);
    }
    if(facingRight == true){
    circle(witchX+78, witchY+3, diameter++);
    }
  }
}

void collision(){
  if(facingLeft == true && shoot == true){ 
    if(witchX-82+20 >= orbX-10 && witchX-82-20 <= orbX+10
     && witchY+1+20 >= orbY-10 && witchY+1-20 <= orbY+10){
       orbX = random(20, 380);
       orbY = random(150, 300);
       orbCount++;
     }
   }
    if(facingRight == true && shoot == true){ 
    if(witchX+78+20 >= orbX-10 && witchX+78-20 <= orbX+10
     && witchY+3+20 >= orbY-10 && witchY+3-20 <= orbY+10){
       orbX = random(20, 380);
       orbY = random(150, 300);
       orbCount++;
     }
   }
   
 }
}
