int SIZE = 80;
void setup()
{
  background(#34D8FF);
  size(SIZE * 10, SIZE * 10);
}

void draw ()
{
  noStroke();
  rectMode(CENTER);
  fill(#07F741);
  rect(400, 600, 400, 100);
  fill(#FFFCFD);
  textSize(32);
  text("START",340,610);
  
  fill(#F5435B);
  text("The Caterpillar Game",250,100);
  
  fill(#FC0810);
  ellipse(310,350,40,40);
  fill(#F9FA5D);
  ellipse(350,350,40,40);
  fill(#F9FA5D);
  ellipse(390,350,40,40);
  fill(#F9FA5D);
  ellipse(430,350,40,40);
  fill(#F9FA5D);
  ellipse(470,350,40,40);
  fill(#090A09);
  ellipse(510,350,40,40);
}

//void mousePressed() {
//  if (mouseX > 400 && mouseX < 800 && mouseY > 600 && mouseY < 700) {
//    
//  }
//}
