int SIZE=80;
boolean end=false;
char[][] board=new char[SIZE][SIZE];

int headX=SIZE/2;
int headY=SIZE/2;
int tailX=(SIZE/2)-3;
int tailY=(SIZE/2);
int score=0;

int time=0;

char[] tempfood=new char[26];
char c='A';
  
char foodletter='a';
boolean game=true;

void setup()
{
  size(SIZE*10,SIZE*10);
  background(0,255,0);
  noStroke();
  
  for(int b=0;b<25;b++)
  {
    tempfood[b]=(char)(c+b);
  }
  
  
  
  resetBoard();
}

void draw()
{
  if(game)
  {
    while (!end&&time==0&&game)
    {
      input();
      end=moveSnake();
      displayBoard(); 
      time++;
    }
    time++;
    if(time==5)
    {
      time=0; 
    }
  }

  else
  {
    //insert menus here
  }
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
  board[tailX][tailY]='K';
  board[headX-1][headY]='H';
  board[headX-2][headY]='H';
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
      if(keyCode==UP&&board[headX][headY]!='S')
        board[headX][headY]='W';
      if(keyCode==DOWN&&board[headX][headY]!='W')
        board[headX][headY]='S';
      if(keyCode==LEFT&&board[headX][headY]!='D')
        board[headX][headY]='A';
      if(keyCode==RIGHT&&board[headX][headY]!='A')
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
        fill(255,255,0);
        ellipseMode(CENTER);
        ellipse(a*10,b*10,10,10);
      }
      
      if(board[a][b]=='I'||board[a][b]=='K'||board[a][b]=='J'||board[a][b]=='L')
      {
        fill(0);
        ellipseMode(CENTER);
        ellipse(a*10,b*10,10,10);
      }
      
      if(board[a][b]>='a'&&board[a][b]<='z')
      {
        fill(255,0,255);
        ellipseMode(CENTER);
        ellipse(a*10,b*10,10,10);
        
        text(tempfood[((int)board[a][b])-97],a*10,(b*10)-12);
        
      }
      
      
      
    }
  }
}

boolean moveSnake()
{
  //Spawns new head
  char f;
  if(board[headX][headY]=='W')
  {
    f=board[headX][headY-1];
    board[headX][headY-1]='W';
    board[headX][headY]='T';
    headY=headY-1;
  }
  else if(board[headX][headY]=='S')
  {
    f=board[headX][headY+1];
    board[headX][headY+1]='S';
    board[headX][headY]='G';
    headY=headY+1;
  }
  else if(board[headX][headY]=='A')
  {
    f=board[headX-1][headY];
    board[headX-1][headY]='A';
    board[headX][headY]='F';
    headX=headX-1;
  }
  else //(board[headX][headY]=='D')
  {
    f=board[headX+1][headY];
    board[headX+1][headY]='D';
    board[headX][headY]='H';
    headX=headX+1;
  }


  //Deletes old tail
  if(!isFood(f))
  {
    if(board[tailX][tailY]=='I')
    {
      board[tailX][tailY-1]=setTail(tailX,tailY-1);
      board[tailX][tailY]='Z';
      tailY=tailY-1;
    }
    else if(board[tailX][tailY]=='J')
    {
      board[tailX][tailY+1]=setTail(tailX,tailY+1);
      board[tailX][tailY]='Z';
      tailY=tailY+1;
    }  
    else if(board[tailX][tailY]=='L')
    {
      board[tailX-1][tailY]=setTail(tailX-1,tailY);
      board[tailX][tailY]='Z';
      tailX=tailX-1;
    }  
    else if(board[tailX][tailY]=='K')
    {
      board[tailX+1][tailY]=setTail(tailX+1,tailY);
      board[tailX][tailY]='Z';
      tailX=tailX+1;
    }
  }
  else 
    score++;

  if(isDead(f))//Is snake dead?
    return true;
  else
    return false;
}

char setTail(int x,int y)
{
  char myreturn='~';
  if(board[x][y]=='T')
  {
    myreturn='I';
  }
  else if(board[x][y]=='G')
  {
    myreturn='J';
  }
  else if(board[x][y]=='F')
  {
    myreturn='L';
  }
  else if(board[x][y]=='H')
  {
    myreturn='K';
  }
  return myreturn;
  
}

boolean isDead (char f)
{
  if(f == 'T' || f == 'G' || f == 'F' || f == 'H' || f == 'I' || f == 'K' || f == 'J' || f == 'L' || headX == 0 || headX == SIZE-1 || headY == 0 || headY == SIZE-1)
    return true;
  else
    return false; 
}

boolean isFood (char f)
{
  if(f>='a'&&f<='z')
  {
    spawnFood();
    return true;
  }
  else
    return false;
}

void spawnFood()
{
    
    board[(int)random(SIZE)][(int)random(SIZE)]=foodletter;
    
    
    
    if(foodletter=='z')
      foodletter='a'; 
    else
      foodletter++;
    
}
