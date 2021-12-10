class Bullet extends Floater{
  protected int myLife;
  Bullet(){
  }
   Bullet(Spaceship theShip){
     myCenterX = theShip.getMyCenterX();
     myCenterY = theShip.getMyCenterY();
     myXspeed = theShip.getMyXspeed();
     myYspeed = theShip.getMyYspeed();
     myPointDirection = theShip.getMyPointDirection();
     myLife = 210;
     accelerate(6);
   }
   public void show(){
     color(255);
     fill(255);
     stroke(255,0,100);
     ellipse((float)myCenterX,(float)myCenterY,5,5);
   }
   public int getMyLife(){
     return myLife;
   }
   public void changeMyLife(int x){
     myLife = myLife + x;
   }
   public double getMyCenterX(){
    return myCenterX;
  }
  public double getMyCenterY(){
    return myCenterY;
  }
  public double getMyXspeed(){
    return myXspeed;
  }
  public double getMyYspeed(){
    return myYspeed;
  }
  public double getMyPointDirection(){
    return myPointDirection;
  }
}
