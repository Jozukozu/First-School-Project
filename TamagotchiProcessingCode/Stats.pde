//PET STATS

//counts down a stat from it's max until it hits 0, if right button pressed stat returned to max
int statMeter(int i, int j)
{
  if(i > 0)
  {
    i--;
  }
  if(keyPressed)
  {
    if(key == 'w' && feedButton == 1)
    {
      i = j;
    }
  }
  
  return i;
}

//how stressed the cat is, and more stressed more noice
void stressLevel(int i, int j)
{
  if(i < j)
  {
    talkStress = talkStress - 0.2;
    volumeStress = volumeStress + 0.2;
  }
  else if(i == j)
  {
    talkStress = talk;
    volumeStress = volume;
  }
}



void energy() //<>//
{
  sleepyEyeSize = eyeSizeY;
  
  if(energy > 0 && sleep == 0)
  {
     energy--;
  }
  
  if(energy < energyMax / 5 && sleep == 0)
  {
   sleepyEyeSize = eyeSizeY / 2;
   sleepyPupilSize = pupilSizeY;
   if(sleepyEyeSize < sleepyPupilSize)
   {
     sleepyPupilSize = sleepyEyeSize;
   } 
  }
  
  //falls asleep
 if(energy <= 0)
 {
  sleepyEyeSize = 1;
  sleepyPupilSize = 0;
  blinkAllowed = 0;
  sleep = 1;
 }
  
  //wakes up
  else if(energy == energyMax)
  {
   sleepyEyeSize = eyeSizeY;
   sleepyPupilSize = pupilSizeY;
   
   sleep = 0;
  }
  
  if(sleep == 1)
  {
    energy++;
    sleepyEyeSize = 1;
    sleepyPupilSize = 0;
  }
}
