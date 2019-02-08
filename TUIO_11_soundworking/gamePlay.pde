void drawGamePage() {
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  textFont(font, 18*scale_factor);
  float obj_size = object_size*scale_factor; 
  boolean isPlayPresent = false;
  boolean isPlayWordPresent =false;
  int CubeSide=0;

  for (int i=0; i<tuioObjectList.size(); i++) {
    TuioObject tobj = tuioObjectList.get(i);
    int objectId= tobj.getSymbolID();
    if (objectId == 4) {
      isPlayPresent=true; //play Game
    }
    rectMode(CORNER);
    pushMatrix();
    translate(tobj.getScreenX(width), tobj.getScreenY(height));
    rotate(tobj.getAngle());
    if (objectId==choiceList[0] ||objectId==choiceList[1] ||objectId==choiceList[2]  ||objectId==choiceList[3] ||objectId==choiceList[4] ||objectId==choiceList[5] ||objectId==choiceList[6] ||objectId==choiceList[7] ||objectId==choiceList[8]  ||objectId==choiceList[9] ||objectId==choiceList[10] ||objectId==choiceList[11]  ||objectId==choiceList[12] ||objectId==choiceList[13] ||objectId==choiceList[14]  ||objectId==choiceList[15]) {
      rect(-obj_size/2, -obj_size/2, obj_size, obj_size);
      fill(255, 255, 102);
    } else {
      fill(255);
    }
    rect(-obj_size/2, -obj_size/2, obj_size, obj_size);
    popMatrix();
    fill(0);
    text(""+tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height));
    wordChoise(objectId);
    if (objectId==106 || objectId==107) {
      isPlayWordPresent =true;
      //println("isPlayWordPresent= " +isPlayWordPresent);
    }else{
    isPlayWordPresent =false;
    }
    if ((objectId>=65) && (objectId<=71)) {
      CubeSide =objectId;
     
    }
  }
  if (isPlayWordPresent) {
    if ((objectId>=65) && (objectId<=71)) {
      wordSoundFile(CubeSide);  //words soundfile
       println(CubeSide);
    }
  }
  
  if ((!isPlayPresent) ) {
    screenState = 0;
  } else {

    areaChecking(); 
    createSoundFile(); //tile soundfiles
    
    
  }
}



void wordChoise(int wordsID) {

  if (wordsID==65) {//we need QR code#100 to activate this layout
    setGame01();
  
    for (int i = 0; i<boxSet.length; i++) {

      boxSet[i].drawBox();
      rangeChecking(0);

    }
  } else if (wordsID==66) {
    setGame02();

    for (int i = 0; i<boxSet.length; i++) {

      boxSet[i].drawBox();
      rangeChecking(0);
    }
  } else if (wordsID==67) {
    setGame03();

  //  wordSoundFile(objectId);
    for (int i = 0; i<boxSet.length; i++) {

      boxSet[i].drawBox();
      rangeChecking(0);
    }
  } else if (wordsID==69) {
    setGame04();

    for (int i = 0; i<boxSet.length; i++) {

      boxSet2[i].drawBox();
      rangeChecking(1);
    }
  } else if (wordsID==70) {
    setGame05();

    for (int i = 0; i<boxSet.length; i++) {

      boxSet2[i].drawBox();
      rangeChecking(1);
    }
  } else if (wordsID==71) {
    setGame06();

    for (int i = 0; i<boxSet.length; i++) {

      boxSet2[i].drawBox();
      rangeChecking(1);
    }
  }
}





void setGame01() {
  for (int i = 0; i<boxSet.length; i++) {
    boxSet[i].setCardId(game01[i]);
  }
}

void setGame02() {
  for (int i = 0; i<boxSet.length; i++) {
    boxSet[i].setCardId(game02[i]);
  }
}
void setGame03() {
  for (int i = 0; i<boxSet.length; i++) {
    boxSet[i].setCardId(game03[i]);
  }
}
void setGame04() {
  for (int i = 0; i<boxSet.length; i++) {
    boxSet2[i].setCardId(game04[i]);
  }
}
void setGame05() {
  for (int i = 0; i<boxSet.length; i++) {
    boxSet2[i].setCardId(game05[i]);
  }
}
void setGame06() {
  for (int i = 0; i<boxSet.length; i++) {
    boxSet2[i].setCardId(game06[i]);
  }
}

void endGame() {
}
