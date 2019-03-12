float soilWidth = 80;
float soilHeight = 80;

float hogHeight = 80;

float grassHeight = 15;

float sunCenter = 50;
float sunDiameter = 120;

float lifeWidth = 50;
float lifeGap = 20;
float lifeTotalGap = lifeWidth + lifeGap;
float lifeX = 10;
float lifeY = 10;

float soldierHeight = 80;
float soldierX = 0;
float soldierY = floor(random(2,5))*soilHeight;

float robotX = floor(random(soilWidth*2,soilWidth*7));
float robotY = floor(random(2,5))*soilHeight;

float laserX = robotX + 25;
float laserY = robotY + 37;
float laserLength = 10;
float laserHeight = 10;
float laserXSpeed = 2;
float laserTravel = 160-35;

PImage bg, hog, life, robot, soil, soldier;


void setup() 
{
  size(640, 480, P2D);
  bg = loadImage("img/bg.jpg");
  hog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  soil = loadImage("img/soil.png");
  robot = loadImage("img/robot.png");  
  soldier = loadImage("img/soldier.png");
  
  
}

void draw() 
{
  //background image
  imageMode(CENTER);
  background (bg);
  
  //grass
  noStroke();
  colorMode(RGB);
  fill(124,204,25);
  rectMode(CORNERS);
  rect(0, height/3 - grassHeight, width, height/3);
  
  image(hog, 320, 120);
  
  
  imageMode(CORNER);
  image(soil, 0, height*1/3);
  image(life, lifeX, lifeY);
  image(life, lifeX + lifeTotalGap, lifeY);
  image(life, lifeX + (2 * lifeTotalGap), lifeY); 
  
  image(soldier, soldierX, soldierY);
  image(robot, robotX, robotY);
  
  //sun
  fill(253,184,19);
  stroke(255,255,0);
  strokeWeight(5);
  ellipse(width-sunCenter, height-(height-sunCenter), sunDiameter, sunDiameter);
  
  //laser
  rectMode(RADIUS);
  noStroke();
  fill(255,0,0);
  rect(laserX, laserY, laserLength, laserHeight, 50);
  
  
  //animation
  soldierX += 4;
  if(soldierX > width)
  {
    soldierX = -80;
  }
  soldierX = soldierX % (width + soldierHeight);
  
  
  //laser animation
     if(laserLength < 40)
  {
    laserLength++;
  }
  
  laserX -= laserXSpeed;
  if(laserX < robotX - laserTravel)
  {
     laserX = robotX+25;
     laserLength = 10;
  }
     
}
