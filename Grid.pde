class Grid {

  Cell [][] cells;
  int rows, cols;
  float cellsize;

  PImage [] portraits;
  int portraitsAmount;
  
  int targetPortraitIndex;

  Grid(int rows, int cols) {
    this.rows = rows;
    this.cols = cols;
    cells = new Cell[this.rows][this.cols];

    portraitsAmount = 12;
    portraits = new PImage[portraitsAmount];
    for (int i=0;i<portraitsAmount;i++) {
      portraits[i] = loadImage(i+".jpg");
    }
    cellsize = portraits[0].width;

    for (int i=0;i<rows;i++) {
      for (int j=0;j<cols;j++) {
        int randomPortrait = floor(random(8));
        float xoffset = -cols/2*cellsize+j*cellsize;
        float yoffset = -rows/2*cellsize+i*cellsize;
        cells[i][j] = new Cell(portraits[randomPortrait],xoffset,yoffset);
      }
    }
    
    targetPortraitIndex = 0;
  }
  
  void display(){
    for (int i=0;i<rows;i++) {
      for (int j=0;j<cols;j++) {
        cells[i][j].display();
      }
    }
  }
  
  void update(){
    for (int i=0;i<rows;i++) {
      for (int j=0;j<cols;j++) {
        float zoffset = brightness(portraits[targetPortraitIndex].pixels[j+i*portraits[targetPortraitIndex].width])*2;
        cells[i][j].update(zoffset,portraits[targetPortraitIndex].pixels[j+i*portraits[targetPortraitIndex].width]);
      }
    }
  }
}

