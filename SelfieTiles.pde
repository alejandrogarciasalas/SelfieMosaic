import peasy.*;
PeasyCam cam;

float xmouse,ymouse;
float xoffset,yoffset;
float rxoffset,ryoffset;

Grid grid;

void setup(){
  //size(800,600,P3D);
  fullScreen(P3D);
  cam = new PeasyCam(this, 10);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(100000);
  
  frameRate(30);
  background(0);
  imageMode(CENTER);
  
  xoffset = width/2;
  yoffset = height/2;
  
  grid = new Grid(50,50);
}
void draw(){
  
  xmouse = mouseX - xoffset;
  ymouse = mouseY - yoffset;
  
  rxoffset = lerp(rxoffset,xmouse/30,0.1);
  ryoffset = lerp(ryoffset,ymouse/30,0.1);
  
  background(0);
  
  //translate(xoffset,yoffset, 10);
  rotateY(radians(rxoffset));
  rotateX(radians(ryoffset));
  
  grid.update();
  grid.display();
}

void keyPressed(){
  if(keyCode == RIGHT){
    grid.targetPortraitIndex = (grid.targetPortraitIndex+1)%grid.portraitsAmount;
  }
}