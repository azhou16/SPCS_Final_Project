int SIZE=80;
boolean end=false;
char[][] board=new char[SIZE][SIZE];
int[] food={2,3,5,7,11,13,17,19};


void setup()
{
  size(SIZE*10,SIZE*10);
  fill(255);
  resetBoard();
}

void draw()
{
  while (!end)
    {
      //input();
      //updateBoard();
      displayBoard();
    }
  
}

void resetBoard()
{
  for(int a=0; a<SIZE; a++)
  {
    for(int b=0; b<SIZE; b++)
    {
      board[a][b]='G'; 
    }
  }
  
  board[14][54]='D';
  for(int a=0; a<20; a++)
  {
    spawnFood(); 
  }
  end=false;
}

/*void input()
{
  if(keyPressed)
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
}*/

void displayBoard()
{
  for(int a=0; a<SIZE; a++)
  {
    for(int b=0; b<SIZE; b++)
    {
      if(board[a][b]=='G')
      {
        fill(0,255,0);
        rectMode(CENTER);
        rect(a*10,b*10,10,10);
      }
    } 
  }
}

void spawnFood()
{
  board[(int)random(SIZE)][(int)random(SIZE)]=X;
}
