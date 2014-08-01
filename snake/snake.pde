int SIZE=80;
boolean end=true;
boolean actualEnd = false;
int[][] board=new int[SIZE][SIZE];
int[] food= {
  2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997
};
int headX=SIZE/2;
int headY=SIZE/2;
int tailX=(SIZE/2)-3;
int tailY=(SIZE/2);
int score=0;

int runSpeed = 7;

int curEat = 0;

PFont mainFont;
PFont menuFont;

int counter = 0;

int time=0;

void setup()
{
  size(SIZE*10, SIZE*10);
  //background(0, 255, 0);
  resetBoard();
  mainFont = loadFont("BookAntiqua-Bold-12.vlw");
  menuFont = loadFont("BookAntiqua-Bold-40.vlw");
}

void draw()
{  
  
  if(end){
    textAlign(CENTER,BOTTOM);
    textFont(menuFont);
    if(actualEnd){
      background(#34D8FF);
      noStroke();
      rectMode(CENTER);
      fill(#07F741);
      rect(400, 600, 400, 100);
      fill(#FFFCFD);
      textSize(32);
      text("EXIT",400,610);
      
      fill(#F5435B);
      text("You Lose",400,100);
      text("You Collected "+curEat+" Prime Numbers!",400,150);
      text("You Died Trying To Collect " + food[curEat],400,200);
      
      
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
    } else {
      background(#34D8FF);
      noStroke();
      rectMode(CENTER);
      fill(#07F741);
      rect(400, 600, 400, 100);
      fill(#FFFCFD);
      textSize(32);
      text("START",400,610);
      
      fill(#F5435B);
      text("The Caterpillar Game",400,100);
      
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
  }
  
  
  while (!end && time==0)
  {
    
    end=moveSnake();
    background(0, 255, 0);
    ellipseMode(CENTER);
    
    noStroke();
    
    textFont(mainFont);
    textAlign(CENTER,CENTER);
    
    displayBoard(); 
    time++;
  }
  time++;
  if (time>=runSpeed){
  
    time=0;
  }
}

void resetBoard()
{
  for (int a=0; a<SIZE; a++)
  {
    for (int b=0; b<SIZE; b++)
    {
      board[a][b]=13;
    }
  }

  board[headX][headY]=3;
  board[tailX][tailY]=11;
  board[headX-1][headY]=7;
  board[headX-2][headY]=7;
  for (int a=0; a<20; a++)
  {
    spawnFood();
  }
  //end=false;
}

//void input()
//{
  //if (keyPressed)
  //{
    //if (key==CODED)
    //{
void keyPressed(){
  if (keyCode==UP && board[headX][headY]!=1){
    board[headX][headY]=0;
  }
  if (keyCode==DOWN && board[headX][headY]!=0){
    board[headX][headY]=1;
  }
  if (keyCode==LEFT && board[headX][headY]!=3){
    board[headX][headY]=2;
  }
  if (keyCode==RIGHT && board[headX][headY]!=2){
    board[headX][headY]=3;
  }
}
    //}
  //}
//}

void displayBoard()
{
  for (int a=0; a<SIZE; a++)
  {
    for (int b=0; b<SIZE; b++)
    {
      /*
      if (board[a][b]=='Z')
      {
        noStroke();
        fill(0, 255, 0);
        rectMode(CENTER);
        rect(a*10, b*10, 10, 10);
      }
      */
      
      if (board[a][b]==0||board[a][b]==1||board[a][b]==2||board[a][b]==3)
      {
        fill(255, 0, 0);
        ellipse(a*10, b*10, 10, 10);
      }

      if (board[a][b]==4||board[a][b]==5||board[a][b]==6||board[a][b]==7)
      {
        fill(255, 255, 0);
        ellipse(a*10, b*10, 10, 10);
      }

      if (board[a][b]==8||board[a][b]==9||board[a][b]==10||board[a][b]==11)
      {
        fill(0);
        ellipse(a*10, b*10, 10, 10);
      }

      if (board[a][b]>=20)
      {
        fill(255, 0, 255);
        ellipse(a*10, b*10, 10, 10);
        fill(0);
        text(food[board[a][b]-20],a*10,b*10-10);
      }
    }
  }
}

boolean moveSnake()
{
  
  boolean myreturn = false;
  
  //Spawns new head
  int f;
  if (board[headX][headY]==0)
  {
    f=board[headX][headY-1];
    board[headX][headY-1]=0;
    board[headX][headY]=4;
    headY=headY-1;
  } else if (board[headX][headY]==1)
  {
    f=board[headX][headY+1];
    board[headX][headY+1]=1;
    board[headX][headY]=5;
    headY=headY+1;
  } else if (board[headX][headY]==2)
  {
    f=board[headX-1][headY];
    board[headX-1][headY]=2;
    board[headX][headY]=6;
    headX=headX-1;
  } else //(board[headX][headY]==3)
  {
    f=board[headX+1][headY];
    board[headX+1][headY]=3;
    board[headX][headY]=7;
    headX=headX+1;
  }


  //Deletes old tail
  if (!isFood(f))
  {
    if (board[tailX][tailY]==8)
    {
      board[tailX][tailY-1]=setTail(tailX, tailY-1);
      board[tailX][tailY]=13;
      tailY=tailY-1;
    } else if (board[tailX][tailY]==9)
    {
      board[tailX][tailY+1]=setTail(tailX, tailY+1);
      board[tailX][tailY]=13;
      tailY=tailY+1;
    } else if (board[tailX][tailY]==10)
    {
      board[tailX-1][tailY]=setTail(tailX-1, tailY);
      board[tailX][tailY]=13;
      tailX=tailX-1;
    } else if (board[tailX][tailY]==11)
    {
      board[tailX+1][tailY]=setTail(tailX+1, tailY);
      board[tailX][tailY]=13;
      tailX=tailX+1;
    }
  } else 
    score++;

  if (isDead(f)){//Is snake dead?
    myreturn = true;
  } else {
    myreturn = false;
  }
  return myreturn;
  
}

int setTail(int x, int y)
{
  int myreturn='~';
  if (board[x][y]==4)
  {
    myreturn=8;
  } else if (board[x][y]==5)
  {
    myreturn=9;
  } else if (board[x][y]==6)
  {
    myreturn=10;
  } else if (board[x][y]==7)
  {
    myreturn=11;
  }
  return myreturn;
}

boolean isDead (int f)
{
  
  boolean stopEverything = false;
  if(f>=20){
    if((curEat < f-20)){
      stopEverything = true;
    }
  }
  
  if (f == 4 || f == 5 || f == 6 || f == 7 || f == 8 || f == 11 || f == 9 || f == 10 || headX == 0 || headX == SIZE-1 || headY == 0 || headY == SIZE-1 || stopEverything)
    return true;
  else
    return false;
}

boolean isFood (int f)
{
  
  
  
  boolean myreturn = false;
  if (f>=20)
  {
    
      
    if(curEat >= f-20){
      spawnFood();
      curEat++;
      myreturn = true;
    }
    
    
  }
  return myreturn;
}

void spawnFood()
{
  
  if(food.length > counter){
    
    int ranX = floor(random(SIZE-10)+5);
    int ranY = floor(random(SIZE-10)+5);
    
    boolean hasPassed = true;
    
    for(int i = 0; i < 7; i++){
      for(int j = 0; j < 7; j++){
        if(checkSpace(i+ranX-3,j+ranY-3) != 13){
          hasPassed = false;
        }
      }
    }
    
    if(hasPassed){
      board[ranX][ranY] = 20+counter;
      counter++;
    }else{
      spawnFood();
    }
    
  }
}

int checkSpace(int Xpos, int Ypos){
  int myreturn = -1;
  if(Xpos > 3 && Xpos < SIZE-4){
    if(Ypos > 3 && Ypos < SIZE-4){
      myreturn = board[Xpos][Ypos];
    }
  }
  return myreturn;
}

void mousePressed(){
  if(abs(mouseX-400)<400/2){
    if(abs(mouseY-600)<100/2){
      end = false;
      
      if(actualEnd){
        exit();
      }
      
      actualEnd = true;
      
    }
  }
}

void mouseWheel(MouseEvent event){
  runSpeed += event.getCount();
}
