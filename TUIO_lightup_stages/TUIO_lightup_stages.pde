import TUIO.*;
// declare a TuioProcessing client
TuioProcessing tuioClient;
import processing.sound.*;
SoundFile file;
import processing.video.*;
Movie myMovie;
boolean isMoviePlaying = false;

int demoT = 4;
int playT = 5;
int readMe =97;
int readWords=0;
PImage img0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
boolean play =false;


// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 15;
float object_size = 60;
float table_size = 760;
float scale_factor = 1;
//int displayWidth=1000;
//int displayHeight=1000;
int screenState = 0;//homepage


int objectId;
//int displayWidth= 800; //Nat: canva size 
//int displayHeight=800; //Nat: canva size 
PFont font;

boolean verbose = false; // print console debug messages
boolean callback = true; // updates only after callbacks
int a= 300; //3-1 x coordinate
int b=300;  //3-1 coordinate
int c=120;
int gap=20;
// I made it this way because it is easier to understand
int b3=b+c+gap;
int b4=b3+gap+c;
int a5=a+gap*2+c;
int a6=a+gap*2+c*2+gap;
int a7=a+gap*2+c+c/2+gap/2;
int R=255;
int G=255;
int B=255;

int game01[] = {1, 10, 3, 1, 34, 4, 54}; //change game 
int game02[]= {102, 102, 102, 3, 2, 4};
int game03[]= {103, 103, 103, 8, 3, 6};
int game04[]= {104, 104, 104, 2, 5, 8};
int game05[]= {105, 105, 105, 9, 0, 4};
int game06[]= {106, 106, 106, 4, 7, 9};
int choiceList[]={36, 52, 53, 54, 56, 58,59, 60, 49, 44, 48, 47};

Box[] boxSet = {
  new Box(a, b, c, R, G, B, a, a+c, b, b+c, 0), 
  new Box(a, b3, c, R, G, B, a, a+c, b+c+gap, b+c*2+gap, 0), 
  new Box(a, b4, c, R, G, B, a, a+c, b4, b4+c, 0), 
  new Box(a5, b, c, R, G, B, a5, a5+gap+c, b, b+c+gap, 3), 
  new Box(a6, b, c, R, G, B, a5+c+gap, a5+c*2+gap, b, b+c+gap, 3), 
  new Box(a7, b3, c, R, G, B, a+gap*2+c+c/2+gap/2, a+gap*2+c*2+c/2+gap/2, b+c+gap, b+2*c+gap, 3), 
  //  new Box(a+gap*2+c+c/2+gap/2+c, b, c, R, G, B, a+gap*2+c+c/2+gap/2+c, a+gap*2+c+c/2+gap/2+c+c, b, b+c, 97)
};

Box[] boxSet2 ={
  new Box(a, b, c, R, G, B, a, a+c, b, b+c, 0), 
  new Box(a+c+gap, b, c, R, G, B, a+c+gap, a+c+gap+c, b, b+c, 0), 
  new Box(a+(c+gap)/2, b+c+gap, c, R, G, B, a+(c+gap)/2, a+(c+gap)/2+c, b+c+gap, b+c+gap+c, 0), 
  new Box(a+c+gap+c+gap, b, c, R, G, B, a+c+gap+c+gap, a+c+gap+c+gap+c, b, b+c, 0), 
  new Box(a+c+gap+c+gap, b+c+gap, c, R, G, B, a+c+gap+c+gap, a+c+gap+c+c, b+c+gap, b+c+gap+c, 0), 
  new Box(a+c+gap+c+gap, b+c+gap+c+gap, c, R, G, B, a+c+gap+c+gap, a+c+gap+c+gap+c, b+c+gap+c+gap, b+c+gap+c+gap+c, 0)
};
Box area;

void setup()
{
  // GUI setup
  noCursor();
  fill(0);
  size(displayWidth, displayHeight);
  noStroke();
  img0=loadImage("01.jpeg");
  img1=loadImage("02.jpeg");
  img2=loadImage("03.jpeg");
  img3=loadImage("04.jpeg");
  img4=loadImage("05.jpeg");

  myMovie = new Movie(this, "Demo.mov");


  if (!callback) {
    frameRate(60);
    loop();
  } else noLoop(); // or callback updates 

  font = createFont("Arial", 18);
  scale_factor = height/table_size;
  tuioClient  = new TuioProcessing(this);
}

void visTuioObject(TuioObject tobj) {
  float obj_size = object_size*scale_factor; 
  //float cur_size = cursor_size*scale_factor; 
  pushMatrix();
  translate(tobj.getScreenX(width), tobj.getScreenY(height));
  rotate(tobj.getAngle());
  fill(255, 255, 255);
  rect(-obj_size/2, -obj_size/2, obj_size, obj_size);
  popMatrix();
  text(""+tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height));
}

PImage drawImage = null;
void draw()
{ 
  background(0);

  if (screenState ==0) {
    drawHomePage();
  } else if (screenState ==1) {
    drawDemoPage();
  } else if (screenState ==2) {
    drawGamePage();
  }
}

void drawHomePage() {

  image(img0, 0, 0, width, height);

  //stroke(255, 0, 0);
  //strokeWeight(3);
  //ellipse(500, 500, 1000, 1000);
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int i=0; i<tuioObjectList.size(); i++) { //under this for loop
    TuioObject tobj = tuioObjectList.get(i);
    int objectId= tobj.getSymbolID();

    if (objectId == 5) {
      screenState = 2; //play Game
    } else if (objectId == 4) {
      screenState = 1;
    }
  }
}

void drawDemoPage() {
  // play video if not already playing
  image(myMovie, 0, 0, displayWidth, displayHeight);
  if (!isMoviePlaying) {

    myMovie.play();
    isMoviePlaying = true;
  }

  boolean isDemoPresent = false;

  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int i=0; i<tuioObjectList.size(); i++) { //under this for loop
    TuioObject tobj = tuioObjectList.get(i);
    int objectId= tobj.getSymbolID();

    if (objectId == 5) {
      screenState = 2; //play Game
    }

    if (objectId == 4) {
      isDemoPresent = true;
    }
  }

  // demo tile disappeared, go home! OR video is over, go home!
  if ((!isDemoPresent) || (myMovie.duration() == myMovie.time())) {
    screenState = 0;
    myMovie.stop();
    isMoviePlaying=false;
  }
}




//


void addTuioObject(TuioObject tobj) {
  if (verbose) println("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
  {
    //soundFile(); //call out sound files here
  }
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  if (verbose) println("set obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
    +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  if (verbose) println("del obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
  //  if (!area.isInBox(tobj.getScreenX(width), tobj.getScreenY(height), area.getMinX(), area.getMaxX(), area.getMinY(), area.getMaxY()) && tobj.getSymbolID()!=97) 
  //  {
  if (play==true) {
    println("stop");
    play=false;
  }
  // }
}



//----------Create words' layout --------------------



// --------------------------------------------------------------
// called when a cursor is added to the scene
void addTuioCursor(TuioCursor tcur) {
  if (verbose) println("add cur "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY());
  //redraw();
}

// called when a cursor is moved
void updateTuioCursor (TuioCursor tcur) {
  if (verbose) println("set cur "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY()
    +" "+tcur.getMotionSpeed()+" "+tcur.getMotionAccel());
  //redraw();
}

// called when a cursor is removed from the scene
void removeTuioCursor(TuioCursor tcur) {
  if (verbose) println("del cur "+tcur.getCursorID()+" ("+tcur.getSessionID()+")");
  //redraw()
}

// --------------------------------------------------------------
// called when a blob is added to the scene
void addTuioBlob(TuioBlob tblb) {
  if (verbose) println("add blb "+tblb.getBlobID()+" ("+tblb.getSessionID()+") "+tblb.getX()+" "+tblb.getY()+" "+tblb.getAngle()+" "+tblb.getWidth()+" "+tblb.getHeight()+" "+tblb.getArea());
  //redraw();
}

// called when a blob is moved
void updateTuioBlob (TuioBlob tblb) {
  if (verbose) println("set blb "+tblb.getBlobID()+" ("+tblb.getSessionID()+") "+tblb.getX()+" "+tblb.getY()+" "+tblb.getAngle()+" "+tblb.getWidth()+" "+tblb.getHeight()+" "+tblb.getArea()
    +" "+tblb.getMotionSpeed()+" "+tblb.getRotationSpeed()+" "+tblb.getMotionAccel()+" "+tblb.getRotationAccel());
  //redraw()
}

// called when a blob is removed from the scene
void removeTuioBlob(TuioBlob tblb) {
  if (verbose) println("del blb "+tblb.getBlobID()+" ("+tblb.getSessionID()+")");
  //redraw()
}

// --------------------------------------------------------------
// called at the end of each TUIO frame
void refresh(TuioTime frameTime) {
  if (verbose) println("frame #"+frameTime.getFrameID()+" ("+frameTime.getTotalMilliseconds()+")");
  if (callback) redraw();
}


void movieEvent(Movie m) {

  myMovie.read();
}
