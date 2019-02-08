class Box {
  //here are the value this entire class has.

  int x;
  int y;
  int up=20;
  int size;
  int minX;
  int maxX;
  int minY;
  int maxY;
  int r;
  int g;
  int b;
  int cardId;


  //here we are saying what value this Box should have; we can sign those value outside of class, see line 11-12
  Box(int x, int y, int size, int r, int g, int b, int minX, int maxX, int minY, int maxY, int cardId) {
    this.x = x;
    this.y = y;
    this.size =size;
    this.minX = minX;
    this.maxX = maxX;
    this.minY = minY;
    this.maxY = maxY;
    this.r=r;
    this.g=g;
    this.b=b;
    this.cardId=cardId;
   
  }

  //here we creating funtion that can get value from class

  int getCardId() {
    return this.cardId;
  }

  void setCardId(int cardId) {
    this.cardId= cardId;
  }

  int getX() {
    return this.x;
  }

  //here we seting value that we get from "get value funtion" witch is getX(){};
  void setX(int x) {
    this.x =x;
  }

  int getY() {
    return this.y;
  }
  void setY(int y) {
    this.y=y;
  }

  int getSize() {
    return this.size;
  }

  void setSize(int size) {
    this.size=size;
  } 

  int getR() {
    return this.r;
  }

  int getG() {
    return this.g;
  }

  int getB() {
    return this.b;
  }

  int getMinX() {
    return this.minX;
  }

  void setMinX(int minX) {
    this.minX=minX;
  }
  int getMaxX() {
    return this.maxX;
  }
  void setMaxX(int maxX) {
    this.maxX=maxX;
  }

  int getMinY() {
    return this.minY;
  }

  void setMinY(int minY) {
    this.minY=minY;
  }
  int getMaxY() {
    return this.maxY;
  }
  void setMaxY(int maxY) {
    this.maxY=maxY;
  }


  //here we creating a function called setFill which inclue three value from class Box
  void setFill(int r, int g, int b) {
    this.r=r;
    this.g=g;
    this.b=b;
  }


  //creating a function that draw a rect();
  void drawEllipse() {
    r=this.getR(); //get value from class Box
    g=this.getG();
    b=this.getB();
    fill(r, g, b); //input value to fill();  if we want to change this value,
    //just write this code:  objectname.setFill(value,value,value); see line 24;
    rectMode(CORNER);
    ellipse(this.getX(), this.getY(), this.getSize(), getSize());
  }
   void drawBox() {
    r=this.getR(); //get value from class Box
    g=this.getG();
    b=this.getB();
    fill(r, g, b); //input value to fill();  if we want to change this value,
    //just write this code:  objectname.setFill(value,value,value); see line 24;
    rectMode(CORNER);
    rect(this.getX(), this.getY(), this.getSize(), getSize());
  }
  

  boolean isInBox(int x, int y, int minX, int maxX, int minY, int maxY) {

    boolean result = false;

    if ((x>minX) && (x<maxX) && (y>minY) && (y<maxY)) {
      result = true;
    }
    return result;
  }
  
  boolean isMatch(int Id){
    boolean result = false;
    if(Id==this.cardId){
    result =true;
    }
    return result;
  }
  
 
}
