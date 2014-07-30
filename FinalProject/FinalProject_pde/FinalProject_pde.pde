int vx = 0;
int vy = 0;
int x = 20;
int y = 20;


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
  x += vx;
  y += vy;
 fill(fillVal);
 ellipse (x,y,25,25); 
}

void keyPressed ()
{
  if (key == CODED)
  { 
    if (keyCode == UP)
  {
    vy = -1;
    vx = 0;
    fillVal = #F57D29;
  }
  else if (keyCode == DOWN)
  {
    vy = 1;
    vx = 0;
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
    vx = -1;
    vy = 0;
    
    fillVal = #2AF64C;
  }
  else if (keyCode == RIGHT)
  {
    vx = 1;
    vy = 0;
    
    fillVal = #2A53F6;
  }
  }
  else
  {
    fillVal = #2AF64C;
  }
}

