class BigBullet extends Bullet{
  BigBullet(Spaceship theShip){
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
     ellipse((float)myCenterX,(float)myCenterY,10,10);
   }
}
