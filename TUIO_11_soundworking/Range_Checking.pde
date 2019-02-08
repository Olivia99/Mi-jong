void rangeChecking(int boxset) {

  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int s=0; s<tuioObjectList.size(); s++) {
    TuioObject tobj = tuioObjectList.get(s);
    int objectId= tobj.getSymbolID();

    if (boxset==0) {
      for (int i = 0; i<boxSet.length; i++) {
          if ((boxSet[0].isMatch(objectId)) &&   (boxSet[1].isMatch(objectId)) &&   (boxSet[2].isMatch(objectId)) &&   (boxSet[3].isMatch(objectId)) &&   (boxSet[4].isMatch(objectId)) &&   (boxSet[5].isMatch(objectId))) {
            screenState=3;
            print(screenState);
            //println(boxSet[0].isMatch(objectId));
          }
        if (boxSet[i].isInBox(tobj.getScreenX(width), tobj.getScreenY(height), boxSet[i].getMinX(), boxSet[i].getMaxX(), boxSet[i].getMinY(), boxSet[i].getMaxY())) 
        { //if object is in the range
          print("obj height= ");
          println(tobj.getScreenX(height));
          //check if the object is the one we wanted.

          if (boxSet[i].isMatch(objectId)) { //3 is the ID number we got from the object.
            boxSet[i].setFill(0, 255, 0);
            boxSet[i].drawBox();
          } else {
            boxSet[i].setFill(255, 0, 0);
            boxSet[i].drawBox();
          }
          boxSet[i].setFill(255, 255, 255);
        
        }
      }
    } else if (boxset==1) {
         if ((boxSet[0].isMatch(objectId)) &&   (boxSet[1].isMatch(objectId)) &&   (boxSet[2].isMatch(objectId)) &&   (boxSet[3].isMatch(objectId)) &&   (boxSet[4].isMatch(objectId)) &&   (boxSet[5].isMatch(objectId))) {
            screenState=3;
            print(screenState);
            //println(boxSet[0].isMatch(objectId));
          }

      for (int i = 0; i<boxSet2.length; i++) {
        if (boxSet2[i].isInBox(tobj.getScreenX(width), tobj.getScreenY(height), boxSet2[i].getMinX(), boxSet2[i].getMaxX(), boxSet2[i].getMinY(), boxSet2[i].getMaxY())) 
        { //if object is in the range
          print("obj height= ");
          println(tobj.getScreenX(height));
          //check if the object is the one we wanted.

          if (boxSet2[i].isMatch(objectId)) { //3 is the ID number we got from the object.
            boxSet2[i].setFill(0, 255, 0);
            boxSet2[i].drawBox();
          } else {
            boxSet2[i].setFill(255, 0, 0);
            boxSet2[i].drawBox();
          }
          boxSet2[i].setFill(255, 255, 255);
        
        }
      }
    }
  }
}
