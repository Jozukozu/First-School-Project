//DRAWING THE PET


int petWander()
{
  //defining the x borders of the pet
  catLeftSide = catPositionX - catWidth / 2;
  catRightSide = catPositionX + catWidth / 2;

  //pet random movement
  if(wanderCount == 0)
  {
    wanderCount = randomInt(0, 99);
    wander = 0;
  }
  if(wander == wanderCount && sleep == 0)
  {
    moveDir = randomInt(0, 5);
    wander = 0;
    wanderCount = 0;
  }
  
  if(moveDir == 0 && catLeftSide <= leftBorder && sleep == 0)
  {
    moveDir = 1; 
  }
  
  else if(moveDir == 1 && catRightSide >= rightBorder  && sleep == 0)
  {
    moveDir = 0; 
  }
  
  if(moveDir == 0 && sleep == 0)
  {
    catPositionX--; 
  }
  
  else if(moveDir == 1 && sleep == 0)
  {
    catPositionX++; 
  }
  
  else
  {
    //changing no values to make the pet stay where it is
  }
  
  if(sleep == 0)
  {
      wander++;
  }
  

  return moveDir;
}


  //body animation
void petAnimation()
{
  if(catAnimHeightDir == 0)
  {
    catAnimHeight = catAnimHeight - animSpeed;
    catPositionY = catPositionY + animSpeed;
    eyesPositionY = eyesPositionY + animSpeed;
  }
  else
  {
    catAnimHeight = catAnimHeight + animSpeed;
    catPositionY = catPositionY - animSpeed;
    eyesPositionY = eyesPositionY - animSpeed;
  }
  if(catHeight <= minCatHeight && catAnimHeightDir == 0)
  {
    catAnimHeightDir = 1;
  }
  else if(catHeight >= fullCatHeight && catAnimHeightDir == 1)
  {
   catAnimHeightDir = 0; 
  }
  catHeight = catAnimHeight;
  
  
  fill(bodyColour1,bodyColour2,bodyColour3);
  ellipse(catPositionX, catPositionY, catWidth, catHeight);
}

//drawing the eyes
void drawEyes(int i)
{
  //make sure eyes are where they should be
  leftEyeX = eyesPositionX - eyeSizeX / 2 - 5;
  leftEyeY = eyesPositionY - 20;
  rightEyeX = eyesPositionX + eyeSizeX / 2 + 5;
  rightEyeY = leftEyeY;
  eyesLeft = catPositionX - catWidth / 2 + eyeSizeX + 15;
  eyesRight = catPositionX + catWidth / 2 - eyeSizeX - 15;
  eyesUp = catPositionY - catHeight / 4 + eyeSizeY;
  eyesDown = catPositionY + catHeight / 4;
  leftPupilX = leftEyeX;
  leftPupilY = leftEyeY;
  rightPupilX = rightEyeX;
  rightPupilY = rightEyeY;

  // eye movement limits
  if(eyesPositionX < eyesLeft)
  {
    eyesPositionX = eyesLeft;
  }
  if(eyesPositionX > eyesRight)
  {
    eyesPositionX = eyesRight;
  }
  
  if(eyesPositionY < eyesUp)
  {
    eyesPositionY = eyesUp + 3;
  }
  if(eyesPositionY > eyesDown)
  {
    eyesPositionY = eyesDown;
  }
  
  if(i == 0)
  {
    eyesPositionX = eyesLeft; 
  }
  else if(i == 1)
  {
    eyesPositionX = eyesRight; 
  }

  blink();

  //draw eyes
  fill(eyeColour1, eyeColour2, eyeColour3);
  ellipse(leftEyeX, leftEyeY, eyeSizeX, blinkSize);
  ellipse(rightEyeX,rightEyeY,eyeSizeX,blinkSize);
  
  //draw pupils
  fill(0);
  ellipse(leftPupilX, leftPupilY, pupilSizeX, blinkPupil);
  ellipse(rightPupilX, rightPupilY, pupilSizeX, blinkPupil);
}

//blinking the pet's eyes
void blink()
{
  if(blinkCounter == 0 && blinkAllowed == 1)
  {
  blinkCounter = randomInt(30, 200);
  }
  if(blinkCounter == 1 || blinkCounter == 9)
  {
      blinkSize = sleepyEyeSize / 1.5;
      blinkPupil = pupilSizeY / 1.5;
  }
  else if(blinkCounter == 2 || blinkCounter == 8)
  {
      blinkSize = sleepyEyeSize / 2;
      blinkPupil = pupilSizeY / 2;
  }
  else if(blinkCounter == 3 || blinkCounter == 7)
  {
      blinkSize = sleepyEyeSize / 3;
      blinkPupil = pupilSizeY / 3;
  }
  else if(blinkCounter == 4 || blinkCounter == 6)
  {
    blinkSize = sleepyEyeSize / 4;
    blinkPupil = pupilSizeY / 4;
  }
  else if(blinkCounter == 5)
  {
   blinkSize = eyeSizeY - eyeSizeY +2; 
   blinkPupil = pupilSizeY -pupilSizeY;
  }
  else
  {
   blinkSize = sleepyEyeSize;
   blinkPupil = sleepyPupilSize;
  }
  blinkCounter--;
}

//drawing nose, mouth and whiskers
void mouth()
{
  //position definitions
  //mouth
  mouthX = eyesPositionX;
  mouthY = eyesPositionY + eyeSizeY / 2 + mouthPositionY;
  
  //nose
  noseA1 = eyesPositionX - 5; //<>//
  noseA2 = mouthY - openMouthSizeY / 2 - 7;
  noseB1 = eyesPositionX + 5;
  noseB2 = mouthY - openMouthSizeY / 2 - 7;
  noseC1 = eyesPositionX;
  noseC2 = mouthY - openMouthSizeY / 2 - 1;
  
  //whiskers
  whiskA1X = noseA1 - 30;
  whiskA1Y = noseA2 - 5;
  whiskA2X = noseA1 - 20;
  whiskA2Y = noseA2;
  
  whiskB1X = noseA1 - 30;
  whiskB1Y = noseA2 + 10;
  whiskB2X = noseA1 - 20;
  whiskB2Y = noseA2 + 7;
  
  whiskC1X = noseB1 + 30;
  whiskC1Y = noseB2 - 5;
  whiskC2X = noseB1 + 20;
  whiskC2Y = noseB2;
  
  whiskD1X = noseB1 + 30;
  whiskD1Y = noseB2 +10;
  whiskD2X = noseB1 + 20;
  whiskD2Y = noseB2 + 7;
  
  
  //drawing mouth, nose and whiskers
  fill(mouthColour1, mouthColour2, mouthColour3); 
  ellipse(mouthX, mouthY, openMouthSizeX, openMouthSizeY);
  triangle(noseA1, noseA2, noseB1, noseB2, noseC1, noseC2);
  stroke(255);
  line(whiskA1X, whiskA1Y, whiskA2X, whiskA2Y);
  line(whiskB1X, whiskB1Y, whiskB2X, whiskB2Y);
  line(whiskC1X, whiskC1Y, whiskC2X, whiskC2Y);
  line(whiskD1X, whiskD1Y, whiskD2X, whiskD2Y);
  noStroke();
}

//meowing animation
void petMeow()
{
  //randomizing meowing
  if(meowCount < 0)
  {
    meowCount = 0;
  }
  if(meow < 0)
  {
   meow = 0; 
  }
  if(meowCount == 0 && meow == 0 && sleep == 0) //<>//
  {
  meowCount = int (random(10,talkStress));
  }
  if(meowCount == 1)
  {
  meowVolume = int (random(10, volumeStress));
  if(meowVolume > 50)
  {
   meowVolume = 50; 
  }
  meow = meowVolume;
  meowCount = 0;
  }

  if(meow > 0 && meow > (meowVolume / 2 + 2) && meow < meowVolume)
    {
      openMouthSizeX++;
      openMouthSizeY++;
    }
  else if(meow > 0 && meow < (meowVolume / 2 - 2))
    {
      openMouthSizeX--;
      openMouthSizeY--;
    }
  else if(meow <= 0)
    {
      openMouthSizeX = mouthSizeX;
      openMouthSizeY = mouthSizeY;
    }
  else
  {
    //changing no values 
  }
    meowCount--;
    meow--;
}

//drawing and animating ears
void petEars()
{
  int earDir = earWiggle();
  if(earDir == 2)
  {
     earTip = earTip + 0.5;
    
    leftEar[4] = leftEyeX + 10;
    leftEar[5] = leftEyeY - eyeSizeY / 2 - 10;
    leftEar[0] = leftEar[4] - eyeSizeX / 2 - 1 - 10 + earTip;
    leftEar[1] = leftEar[5] - 20 - earTip;
    leftEar[2] = leftEar[4] - eyeSizeX / 2 - 10;
    leftEar[3] = leftEar[5] + 12;
    
    
    rightEar[4] = rightEyeX - 10;
    rightEar[5] = rightEyeY - eyeSizeY / 2 - 10;
    rightEar[0] = rightEar[4] + eyeSizeX / 2 + 1 + 10 - earTip;
    rightEar[1] = rightEar[5] - 20 - earTip;
    rightEar[2] = rightEar[4] + eyeSizeX / 2 + 10;
    rightEar[3] = rightEar[5] + 12;
  }

  else if(earDir == 1)
  {
     earTip = earTip - 0.5;
    
    leftEar[4] = leftEyeX + 10;
    leftEar[5] = leftEyeY - eyeSizeY / 2 - 10;
    leftEar[0] = leftEar[4] - eyeSizeX / 2 - 1 - 10 - earTip;
    leftEar[1] = leftEar[5] - 20 + earTip;
    leftEar[2] = leftEar[4] - eyeSizeX / 2 - 10;
    leftEar[3] = leftEar[5] + 12;
    
    rightEar[4] = rightEyeX - 10;
    rightEar[5] = rightEyeY - eyeSizeY / 2 - 10;
    rightEar[0] = rightEar[4] + eyeSizeX / 2 + 1 + 10 + earTip;
    rightEar[1] = rightEar[5] - 20 + earTip;
    rightEar[2] = rightEar[4] + eyeSizeX / 2 + 10;
    rightEar[3] = rightEar[5] + 12;
  }
  
  else
  {
    earTip = 0;
      
    leftEar[4] = leftEyeX + 10;
    leftEar[5] = leftEyeY - eyeSizeY / 2 - 10;
    leftEar[0] = leftEar[4] - eyeSizeX / 2 - 1 - 10;
    leftEar[1] = leftEar[5] - 20;
    leftEar[2] = leftEar[4] - eyeSizeX / 2 - 10;
    leftEar[3] = leftEar[5] + 12;
    
    rightEar[4] = rightEyeX - 10;
    rightEar[5] = rightEyeY - eyeSizeY / 2 - 10;
    rightEar[0] = rightEar[4] + eyeSizeX / 2 + 1 + 10;
    rightEar[1] = rightEar[5] - 20;
    rightEar[2] = rightEar[4] + eyeSizeX / 2 + 10;
    rightEar[3] = rightEar[5] + 12;
  }

  //drawing the ears
  fill((bodyColour1 + 30 * ((256 - red) * 0.01)), (bodyColour2 + 30 * ((256 - green) * 0.01)), (bodyColour3 + 30 * ((256 - blue) * 0.01)));
  triangle(leftEar[0], leftEar[1], leftEar[2], leftEar[3], leftEar[4], leftEar[5]);
  triangle(rightEar[0], rightEar[1], rightEar[2], rightEar[3], rightEar[4], rightEar[5]);
}

//ear wiggle randomizer
int earWiggle()
{
  if(wiggleCounter == 0)
  {
   wiggleCounter = randomInt(40, 500);
  }
  
  if((wiggleCounter <= 36 && wiggleCounter > 27) || (wiggleCounter <= 9 && wiggleCounter > 0))
  {
    wiggleDir = 2;
  }
  
  else if(wiggleCounter <= 27 && wiggleCounter > 9)
  {
    wiggleDir = 1;
  }
  
  else
  {
   wiggleDir = 0; 
  }

  wiggleCounter--;
  return wiggleDir;
}
