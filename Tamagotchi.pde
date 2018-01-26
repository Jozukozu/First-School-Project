
//creating all the needed variables
float catPositionX, catPositionY, catLeftSide, catRightSide;
float catWidth, catHeight, fullCatHeight, minCatHeight, catAnimHeight, animSpeed;
int catAnimHeightDir, moveDir, wander, wanderCount;
int bodyColour1, bodyColour2, bodyColour3, eyeColour1, eyeColour2, eyeColour3, blinkCounter;
float eyesPositionX, eyesPositionY, leftEyeX, leftEyeY, rightEyeX, rightEyeY, blinkSize; 
float pupilsPositionX, pupilsPositionY, pupilSizeX, pupilSizeY, leftPupilX, leftPupilY, rightPupilX, rightPupilY, blinkPupil;
float eyeSizeX, eyeSizeY, eyesLeft, eyesRight, eyesUp, eyesDown;
int displayWidth = 480;
int displayHeight = 384;
int leftBorder = 0;
int rightBorder = displayWidth;
int hunger, hungerMax;
int blinkAllowed;
float noseA1, noseA2, noseB1, noseB2, noseC1, noseC2, mouthX, mouthY, mouthSizeX, mouthSizeY;
float openMouthSizeX, openMouthSizeY, mouthPositionY;
float whiskA1X, whiskA1Y, whiskA2X, whiskA2Y, whiskB1X, whiskB1Y, whiskB2X, whiskB2Y, whiskC1X, whiskC1Y, whiskC2X, whiskC2Y;
float whiskD1X, whiskD1Y, whiskD2X, whiskD2Y;
int mouthColour1, mouthColour2, mouthColour3, noseColour1, noseColour2, noseColour3;
int meowCount, meow, meowVolume, talk, volume; 
float talkStress, volumeStress;
float[] leftEar = new float[6];
float[] rightEar = new float[6];
float earTip = 0;
int wiggleCounter, wiggleDir;
int energyMax, energy, sleep;
float sleepyEyeSize, sleepyPupilSize;
int red, green, blue;

//setting all the starter values
void setup() {
  //screen's size
  size(displayWidth, displayHeight);
  
  //pet dimensions and idle animation speed
  catWidth = 150;
  fullCatHeight = 150;
  animSpeed = 0.25;
  minCatHeight = fullCatHeight - 5;
  catHeight = fullCatHeight;
  catAnimHeight = fullCatHeight;
  catAnimHeightDir = 0;
  
  //pet's starting position
  catPositionX = displayWidth / 2;
  catPositionY = displayHeight - catHeight;
  
  //eye and pupil size, shape and starting position
  eyeSizeX = randomInt(20, 40);
  eyeSizeY = randomInt(20, 40);
  if(eyeSizeY > eyeSizeX)
  {
    eyeSizeY = eyeSizeY - (eyeSizeY - eyeSizeX);
  }
  pupilSizeY = randomFloat(10, (eyeSizeY - 5));
  pupilSizeX = randomFloat(10, (eyeSizeX - 5));
  if(pupilSizeX > pupilSizeY)
  {
   pupilSizeX = pupilSizeX - (pupilSizeX - pupilSizeY + 1); 
  }
  eyesPositionX = catPositionX;
  eyesPositionY = catPositionY;
  pupilsPositionX = eyesPositionX;
  pupilsPositionY = eyesPositionY;
  
  //mouth starting position and size
  mouthX = eyesPositionX;
  mouthPositionY = randomFloat(3, 7);
  mouthSizeX = 20;
  mouthSizeY = 3;
  
  //all the colours
  red = randomInt(-40, 256);
  green = randomInt(red - 40, red);
  blue = randomInt(green - 40 - (red - green), green - (red - green));
  if(red < 0)
  {
    red = 0;
  }
     
  if(green < 0)
  {
    green = 0;
  }
 
  if(blue < 0)
  {
    blue = 0;
  }
   
  
  bodyColour1 = red;
  bodyColour2 = green;
  bodyColour3 = blue;
  eyeColour1 = randomInt(70, 256);
  eyeColour2 = randomInt(70, 256);
  eyeColour3 = randomInt(70, 256);
  mouthColour1 = randomInt(40, 256);
  mouthColour2 = randomInt(0, 30);
  mouthColour3 = randomInt(0, 50);
  noseColour1 = randomInt(0, 256);
  noseColour1 = randomInt(0, 256);
  noseColour1 = randomInt(0, 256);
  
  //other controllers
  hungerMax = 1000;
  hunger = hungerMax;
  
  energyMax = 1000;
  energy = energyMax;
  
  blinkAllowed = 1;
  blinkCounter = 0;
  
  moveDir = randomInt(0, 3);
  wander = 0;
  wanderCount = 0;
  
  meowCount = 0;
  
  talk = 300;
  volume = 10;
  talkStress = talk;
  volumeStress = volume;
  
  wiggleDir = 0;
  
  sleepyEyeSize = eyeSizeY;
  sleepyPupilSize = pupilSizeY;
  sleep = 0;
}

void draw() 
{
//drawing background white each draw
background(255);

//disabling drawing border colour on objects
noStroke();

buttons();

backGround();

//playing all the functions
hunger = statMeter(hunger, hungerMax);

energy();

stressLevel(hunger,hungerMax);

int direction = petWander();

petAnimation();

petEars();

drawEyes(direction);

petMeow();

mouth();
}