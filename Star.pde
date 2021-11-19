class Star //note that this class does NOT extend Floater
{
  private float myX,  myY;
  private int myRedColor, myBlueColor, myGreenColor;
  public Star(){
    myX = (float)(Math.random()*500);
    myY = (float)(Math.random()*500);
    myRedColor = (int)(Math.random()*255);
    myBlueColor = (int)(Math.random()*255);
    myGreenColor = (int)(Math.random()*255);
  }
  public void show(){
    fill(myRedColor, myBlueColor, myGreenColor);
    stroke(myRedColor, myBlueColor, myGreenColor);
    ellipse(myX,myY,5,5);
  }
}
