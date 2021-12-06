class Asteroid extends Floater{
  protected double myRotSpeed;
  protected int size;
  public Asteroid(int s){
    corners = 6;
    size = s;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -3*size + (int)(((Math.random()*3) -1)*(size/2 + 1));
    yCorners[0] = 4*size + (int)(((Math.random()*3) -1)*(size/2 + 1));
    xCorners[1] = -5*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    yCorners[1] = 0*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    xCorners[2] = -3*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    yCorners[2] = -4*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    xCorners[3] = 3*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    yCorners[3] = -4*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    xCorners[4] = 5*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    yCorners[4] = 0*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    xCorners[5] = 3*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    yCorners[5] = 4*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    myColor = 255;
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*height;
    myXspeed = Math.random()*2-1;
    myYspeed = Math.random()*2-1;
    myPointDirection = 0;
    myRotSpeed = (Math.random()*9) - 4;
  }
   public Asteroid(int s, double x, double y){
    corners = 6;
    size = s;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -3*size + (int)(((Math.random()*3) -1)*(size/2 + 1));
    yCorners[0] = 4*size + (int)(((Math.random()*3) -1)*(size/2 + 1));
    xCorners[1] = -5*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    yCorners[1] = 0*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    xCorners[2] = -3*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    yCorners[2] = -4*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    xCorners[3] = 3*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    yCorners[3] = -4*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    xCorners[4] = 5*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    yCorners[4] = 0*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    xCorners[5] = 3*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    yCorners[5] = 4*size+ (int)(((Math.random()*3) -1)*(size/2 + 1));
    myColor = 255;
    myCenterX = x;
    myCenterY = y;
    myXspeed = Math.random()*2-1;
    myYspeed = Math.random()*2-1;
    myPointDirection = 0;
    myRotSpeed = (Math.random()*9) - 4;
  }
  public void move(){
    super.move();
    myPointDirection = myPointDirection + myRotSpeed;
  }
  public double getMyCenterX(){
    return myCenterX;
  }
  public double getMyCenterY(){
    return myCenterY;}
  public int getMySize(){
    return size;
  }
}
