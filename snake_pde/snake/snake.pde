int SIZE=80;
//boolean end=false;
char[][] board=new char[SIZE][SIZE];
int[] food={2,3,5,7,11,13,17,19};
int headX=SIZE/2;
int headY=SIZE/2;

void setup()
{
  size(SIZE*10,SIZE*10);
  background(0,255,0);
  resetBoard();
}

void draw()
{
  //while (!end)
 //   {
      input();
      //updateBoard();
      displayBoard();
  //  }
}

void resetBoard()
{
  for(int a=0; a<SIZE; a++)
  {
    for(int b=0; b<SIZE; b++)
    {
      board[a][b]='Z'; 
    }
  }
  
  board[headX][headY]='D';
  for(int a=0; a<20; a++)
  {
    spawnFood(); 
  }
  //end=false;
}

void input()
{
  if(keyPressed)
  {
    if(key==CODED)
    {
      if(keyCode==UP)
        board[headX][headY]='W';
      if(keyCode==DOWN)
        board[headX][headY]='S';
      if(keyCode==LEFT)
        board[headX][headY]='A';
      if(keyCode==RIGHT)
        board[headX][headY]='D';
      
    }
  }
}

void displayBoard()
{
  for(int a=0; a<SIZE; a++)
  {
    for(int b=0; b<SIZE; b++)
    {
      if(board[a][b]=='Z')
      {
        noStroke();
        fill(0,255,0);
        rectMode(CENTER);
        rect(a*10,b*10,10,10);
      }
      
      if(board[a][b]=='W'||board[a][b]=='S'||board[a][b]=='A'||board[a][b]=='D')
      {
        fill(255,0,0);
        ellipseMode(CENTER);
        ellipse(a*10,b*10,10,10);
      }
      
      if(board[a][b]=='T'||board[a][b]=='G'||board[a][b]=='F'||board[a][b]=='H')
      {
        fill(0,255,0);
        ellipseMode(CENTER);
        ellipse(a*10,b*10,10,10);
      }
      
      if(board[a][b]=='I'||board[a][b]=='K'||board[a][b]=='J'||board[a][b]=='L')
      {
        
      }
      
      if(board[a][b]=='X')
      {
        fill(255,0,255);
        ellipseMode(CENTER);
        ellipse(a*10,b*10,10,10);
      }
      
      
    }
  }
}

void spawnFood()
{
  board[(int)random(SIZE)][(int)random(SIZE)]=X;
}
