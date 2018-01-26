//FUNCTIONS


//random integer
int randomInt(int j, int k)
{
  int i = int (random(j, k));
  return i;
}

//random float
float randomFloat(float j, float k)
{
  float i = random(j, k);
  return i;
}


int feedButton = 0;
int exitButton = 0;

void buttons()
{
  fill(248, 194, 16);
  rect(0, displayHeight - 60, displayWidth, 60);

  fill(161,62,204);
  textSize(25);
  text("Feed",20, displayHeight - 20);
  text("Exit",displayWidth - 70, displayHeight - 20); 
  
  if(keyPressed == true)
  {
   if(key == 'a')
   {
      feedButton = 1;
      exitButton = 0;
   }
   
   else if(key == 's')
   {
     exitButton = 1;
     feedButton = 0;
   }
  }

  if(feedButton == 1)
  {
   noFill();
   strokeWeight(3);
   stroke(162, 113, 247);
   rect(10, displayHeight - 45, 80, 35);
   noStroke();
   strokeWeight(1);
  }
    
  if(exitButton == 1)
  {
     noFill();
     strokeWeight(3);
     stroke(162, 113, 247);
     rect(400, displayHeight - 45, 70, 35);
     noStroke();
     strokeWeight(1);
  }
}


float[] point = new float [6];

void backGround()
{
  fill(255,255,255);
  rect(0, 0, displayWidth, displayHeight - 60);
  
  
  for(int i = 0; i < 5; i++)
  {
    for(int j = 0; j < 10; j++)
    {
      if(j == 0)
      {
        point[0] = 0;
        point[1] = 32.4 + (64.8 * i);
        point[2] = 48;
        point[3] = 0 + (64.8 * i);
        point[4] = 48;
        point[5] = 64.8 + (64.8 * i); 
        
      }
      
      else if(j % 2 != 0 && j != 0)
      {
        point[0] = point[0] + 96;
      }
      
      else
      {
        point[2] = point[2] + 96;
        point[4] = point[4] + 96;
      }
       fill(184,255,108);
       triangle(point[0],point[1],point[2],point[3],point[4],point[5]);
    }
  }
}