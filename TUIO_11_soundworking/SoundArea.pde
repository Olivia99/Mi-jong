void areaChecking() { // draw an area box for sound produce and checking if the tile is in the area box
  //areaChecking() is called out under gamePlay tab line 35;
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();

  for (int s=0; s<tuioObjectList.size(); s++) {

    TuioObject tobj = tuioObjectList.get(s);
    //  float obj_size = object_size*scale_factor; 
    //float cur_size = cursor_size*scale_factor; 
    int objectId= tobj.getSymbolID();
    //String path=".mp3";
    //String pathName = objectId + path;
    // int size=160;
    rectMode(CORNER);
    area = new Box(tobj.getScreenX(width), tobj.getScreenY(height), 200, 255, 100, 200, tobj.getScreenX(width), tobj.getScreenX(width)+200, tobj.getScreenY(height), tobj.getScreenY(height)+200, 97);
    if (objectId==97) { //detecting fiducial for sound area
      area.drawBox();  
      //print("box draw");
    }
  }
}
//fix



void createSoundFile() { //create and produce sound when the tile is inside area box
  //createSoundFile() is called out under gamePlay tab line 36
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();

  boolean isTilePresent = false;

  for (int s=0; s<tuioObjectList.size(); s++) {

    TuioObject tobj = tuioObjectList.get(s);
    //  float obj_size = object_size*scale_factor; 
    //float cur_size = cursor_size*scale_factor; 
    int objectId= tobj.getSymbolID();
    //String path=".mp3";
    //String pathName = objectId + path;

    if ( (objectId>=36) && (objectId<=62)) {
      isTilePresent = true;
    }

    if (area.isInBox(tobj.getScreenX(width), tobj.getScreenY(height), area.getMinX(), area.getMaxX(), area.getMinY(), area.getMaxY()) &&(objectId!=97) &&(objectId!=4) &&(objectId!=5) &&(objectId!=65)&&(objectId!=66)&&(objectId!=67)&&(objectId!=69)&&(objectId!=70)&&(objectId!=106)&&(objectId!=107)) 
    {
      if ( isTilePresent) {
        if (!sounds[objectId-36].isPlaying()) {
        
          sounds[objectId-36].play(); 
           sounds[objectId-36].rewind();//call out play sound file function(not sure if I need to seperate this function from the loop
          println("soundpaly");
        }
      }
    }
  }
}













void wordSoundFile(int wordId) { //create sound file for word
  //wordSoundFile() is called out under gamePlay tab line 34
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();

  boolean isWordPalyed=false;

  for (int s=0; s<tuioObjectList.size(); s++) {

    TuioObject tobj = tuioObjectList.get(s);
    int wordsID =wordId;

    // int objectId= tobj.getSymbolID();
    if (!isWordPalyed) {
      if (wordsID>=65 && wordsID<=71) {
        if (!words[wordsID-65].isPlaying()) {
          words[wordsID-65].rewind(); 
          words[wordsID-65].play(); 
          println("inbox");
          isWordPalyed=true;
        }
      }
    }
  }
}
