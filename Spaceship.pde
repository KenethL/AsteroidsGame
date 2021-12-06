class Spaceship extends Floater{ 
   public Spaceship(){
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 12;
    yCorners[0] = 0;
    xCorners[1] = -6;
    yCorners[1] = -6;
    xCorners[2] = -4;
    yCorners[2] = 0;
    xCorners[3] = -6;
    yCorners[3] = 6;
    myColor = 255;
    myCenterX = 250;
    myCenterY = 250;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 1;
  }
  public void setMyPointDirection(float x, float y){
    double deg = Math.atan2((myCenterY - y)*-1,(myCenterX - x)*-1);
    myPointDirection = degrees((float)deg);
  }
  public void speedCap(){
    if(myXspeed > 8){
      myXspeed = 8;
    }
    if(myYspeed > 8){
      myYspeed = 8;
    }
    if(myXspeed< -8){
      myXspeed = -8;
    }
    if(myYspeed < -8){
      myYspeed = -8;
    }
  }
  public void dash(double x, double y){
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = myCenterX + x;
    myCenterY = myCenterY + y;
  }
  public void hyperspace(){
    myCenterX = Math.random()*500;
    myCenterY = Math.random()*500;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = (Math.random()*2);
  }
  public void sideAcceleration(double dAmount){
    double dRadians = (myPointDirection+90)*(Math.PI/180);   
    myXspeed += ((dAmount) * Math.cos(dRadians));    
    myYspeed += ((dAmount) * Math.sin(dRadians));    
  }
  public double getMyCenterX(){
    return myCenterX;
  }
  public double getMyCenterY(){
    return myCenterY;
  }
}
