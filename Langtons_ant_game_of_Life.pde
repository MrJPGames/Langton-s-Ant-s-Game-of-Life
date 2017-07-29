int posX=100, posY=100, dir=0;
int[][]  board = new int[200][200];

boolean GoL=true, Ant=true; //For turning each on and off at any time

void setup(){
  size(800,800);
  reset();
}

void reset(){
 for (int i=0; i < 200; i++){
    for (int j=0; j < 200; j++){
      if (random(100) > 50){
        board[i][j]=1; 
      }else{
        board[i][j]=0;
      }
    }
  } 
}

int inBoundsPos(int i){
  int ret=i;
  if (i >= 200)
    ret=0;
  if (i < 0)
    ret = 199;
  return ret;
}

int getNeighbors(int x, int y){
  int ret=0;
  for (int i=x-1; i<=x+1; i++){
     for (int j=y-1; j<=y+1; j++){
       if (i != x || j != x){
           if (board[inBoundsPos(i)][inBoundsPos(j)] == 1){
             ret++;
           }
       }
     }
  }
  return ret;
}

void GameOfLife(){
  int[][] newboard = new int[200][200];
  for (int i=0; i<200; i++){
    for (int j=0; j<200; j++){
      newboard[i][j]=board[i][j];
      int neighbors = getNeighbors(i,j); 
      if (board[i][j] == 1){
        if (neighbors > 3 || neighbors < 2)
          newboard[i][j]=0;
      }else if (neighbors == 3){
        newboard[i][j]=1; 
      }
    }
  }
  for (int i=0; i<200; i++){
    for (int j=0; j<200; j++){
      board[i][j]=newboard[i][j];
    }
  }
}

void LangtonsAnt(){
 if (board[posX][posY] == 1){
    board[posX][posY]=0;
     switch (dir){
       case 0:
         dir=1;
         posX++;
         break;
       case 1:
         dir=2;
         posY++;
         break;
       case 2:
         dir=3;
         posX--;
         break;
       case 3:
         dir=0;
         posY--;
         break;
     }
  }else{
    board[posX][posY]=1;
    switch (dir){
       case 0:
         dir=3;
         posX--;
         break;
       case 1:
         dir=0;
         posY--;
         break;
       case 2:
         dir=1;
         posX++;
         break;
       case 3:
         dir=2;
         posY++;
         break;
     }
  }
  if (posX < 0)
    posX=199;
  if (posY < 0)
    posY=199;
  if (posX >= 200)
    posX=0;
  if (posY >= 200)
    posY=0; 
}

void loop(){
  if (Ant) LangtonsAnt();
  if (GoL) GameOfLife();
  if (keyPressed){
    if (key == 'a'){
       Ant=!Ant; 
    }
    if (key == 'l'){
      GoL=!GoL;
    }
    if (key == 'r'){
      reset();
    }
  }
}

void draw(){
  stroke(0,0,0);
  for (int i=0; i < 200; i++){
    for (int j=0; j < 200; j++){
      if (board[i][j] == 1){
        fill(0,0,0);
        rect(width/200*i, height/200*j, width/200, height/200);
      }else{
        fill(255,255,255);
        rect(width/200*i, height/200*j, width/200, height/200);
      }
    }
  }
  loop();
  fill(255,0,0);
  rect(width/200*posX, height/200*posY, width/200, height/200);
}