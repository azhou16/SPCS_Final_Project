void setup ()
{
 size (800,800); 
 background (255);
 
 textSize (20);
 fill (255,0,0);
 text ("ABC, Hello World", 50,100);
 
  fill (random(256),random(256),random(256));
}


color fillVal = color(random(256));
void draw ()
{
 fill(fillVal);
 ellipse (20,20,25,25); 
}

void keyPressed ()
{
  if (key == CODED)
  { 
    if (keyCode == UP)
  {
    fillVal = #F57D29;
  }
  else if (keyCode == DOWN)
  {
    fillVal = #AB2AF6;
  }
  }
  else
  {
    fillVal = #F57D29;
  }
  if (key == CODED)
  { 
    if (keyCode == LEFT)
  {
    fillVal = #2AF64C;
  }
  else if (keyCode == RIGHT)
  {
    fillVal = #2A53F6;
  }
  }
  else
  {
    fillVal = #2AF64C;
  }
}
