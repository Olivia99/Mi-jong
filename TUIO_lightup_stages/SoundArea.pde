void areaChecking() {

  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();

  for (int s=0; s<tuioObjectList.size(); s++) {

    TuioObject tobj = tuioObjectList.get(s);
    //  float obj_size = object_size*scale_factor; 
    //float cur_size = cursor_size*scale_factor; 
    int objectId= tobj.getSymbolID();
    // int size=160;
    rectMode(CORNER);
    area = new Box(tobj.getScreenX(width), tobj.getScreenY(height), 300, 200, 100, 200, tobj.getScreenX(width), tobj.getScreenX(width)+300, tobj.getScreenY(height), tobj.getScreenY(height)+300, 97);
    if (objectId==97) { //detecting fiducial for sound area
      area.drawBox();
      print("box draw");
    }
  }
}


void soudPlay() {
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int s=0; s<tuioObjectList.size(); s++) {
    TuioObject tobj = tuioObjectList.get(s);
    int objectIdLocal= tobj.getSymbolID();
    if (area.isInBox(tobj.getScreenX(width), tobj.getScreenY(height), area.getMinX(), area.getMaxX(), area.getMinY(), area.getMaxY()) && objectIdLocal!=97) 
    {
      //String path=".mp3";
      //String pathName = objectIdLocal + path;
      ////  if (play==false) {
      //file = new SoundFile(this, pathName);
      if (file != null) { 
        if (play == false) {
          file.play();
          print("play");
          play=true;
        }
      }

      // }
    }
  }
}
