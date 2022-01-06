int screenX = 1700;
int screenY = 1000;
int coordX = 0;
int coordY = 0;
float currRealComp;
float currImagComp;
int maxIterations;

float startRealComp = -1.5;
float startImagComp = 1;

float stepInt = .002;
boolean setRedraw = true;

void setup(){
  size(1700, 1000);
  maxIterations = 255;
  
}

void draw() {
  int index = 0;
  float realComp;
  float imagComp;
  float tempReal;
  
  if (setRedraw){
    coordY = 0;
    currRealComp = startRealComp;
    currImagComp = startImagComp;
    
    while(coordY < screenY){
      index = 0;
      realComp = currRealComp;
      imagComp = currImagComp;
      while (index < maxIterations && dist(0,0,realComp, imagComp) < 2){
        tempReal = realComp*realComp - imagComp*imagComp + currRealComp;
        imagComp = 2*realComp*imagComp + currImagComp;
        realComp = tempReal;
        index++;
      }
      set(coordX, coordY, color(0));
      if (index > 5) set(coordX, coordY, color(255));
      if (index > 10) set (coordX, coordY, color(0));
      if (index > 20) set(coordX, coordY, color(255));
      if (index > 30) set (coordX, coordY, color(0));
      if (index > 40) set(coordX, coordY, color(255));
      if (index > 60) set (coordX, coordY, color(0));
      if (index > 80) set(coordX, coordY, color(255));
      if (index > 100) set (coordX, coordY, color(0));
      if (index > 120) set(coordX, coordY, color(255));
      if (index > 170) set (coordX, coordY, color(0));
      if (index > 200) set(coordX, coordY, color(255));
      if (index > 230) set (coordX, coordY, color(0));
      
      //set(coordX, coordY, color(index, 0, 0));
      //if (index > 15) set(coordX, coordY, color(205, 0, 0));
      //if (index > 25) set(coordX, coordY, color(180, 0, 0));
      //if (index > 35) set(coordX, coordY, color(155, 0, 0));
      //if (index > 45) set(coordX, coordY, color(130, 0, 0));
      //if (index > 55) set(coordX, coordY, color(105, 0, 0));
      //if (index > 65) set(coordX, coordY, color(80, 0, 0));
      //if (index > 80) set(coordX, coordY, color(55, 0, 0));
      //if (index = 99) set(coordX, coordY, color(30, 0, 0));
      
      currRealComp += stepInt;
      coordX++;
      if (coordX > screenX){
        currRealComp = startRealComp;
        coordX = 0;
        coordY++;
        currImagComp -= stepInt;
      }
    }
    setRedraw = false;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  float realCenter = startRealComp + mouseX * stepInt;
  float imagCenter = startImagComp - mouseY * stepInt;
  
  println("realCenter: " + realCenter + "   imagCenter: " + imagCenter);
  
  if (e > 0) stepInt = stepInt*.8;
  else stepInt = stepInt*1.2;
 
  startRealComp = realCenter - screenX/2*stepInt;
  startImagComp = imagCenter + screenY/2*stepInt;
  
 println("mouseX: " + mouseX + "  mouseY: " + mouseY + " stepInt: " + stepInt);
 println("startReal: " + startRealComp + "  startImagComp: " + startImagComp);
 
  setRedraw = true;
}

void mouseClicked(){
 saveFrame("mSet_BW####.jpg");
}
