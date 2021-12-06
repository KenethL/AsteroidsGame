//your variable declarations here
Spaceship bob = new Spaceship();
Star[] daves = new Star[250];
ArrayList <Asteroid> jacobs = new ArrayList <Asteroid>();
private int cooldown = 0;
private boolean wIsPressed, dIsPressed = false;
private boolean sIsPressed, aIsPressed = false;
public void setup() 
{
  size(1000, 800);
  for(int i = 0; i < daves.length; i++){
    daves[i] = new Star();
  }
  for(int i = 0; i < 14; i++){
    jacobs.add(new Asteroid(18));
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i < daves.length; i++){
    daves[i].show();
  }
  for(int i = 0; i < jacobs.size(); i++){
  jacobs.get(i).show();
  jacobs.get(i).move();
   if(dist((float)jacobs.get(i).getMyCenterX(), (float)jacobs.get(i).getMyCenterY(), (float)bob.getMyCenterX(), (float)bob.getMyCenterY()) < 5*jacobs.get(i).getMySize()){
     jacobs.add(new Asteroid((jacobs.get(i).getMySize()/3), jacobs.get(i).getMyCenterX()+(Math.random()*100-50), jacobs.get(i).getMyCenterY()+(Math.random()*100-50)));
     jacobs.add(new Asteroid((jacobs.get(i).getMySize()/3), jacobs.get(i).getMyCenterX()+(Math.random()*100-50), jacobs.get(i).getMyCenterY()+(Math.random()*100-50)));
     jacobs.add(new Asteroid((jacobs.get(i).getMySize()/3), jacobs.get(i).getMyCenterX()+(Math.random()*100-50), jacobs.get(i).getMyCenterY()+(Math.random()*100-50)));
     jacobs.remove(i);
     i--;
   }
   else if (jacobs.get(i).getMySize() <= 1){
     jacobs.remove(i);
     i--;
   }
  }
  bob.move();
  bob.show();
  bob.setMyPointDirection(mouseX,mouseY);
  bob.speedCap();
  cooldown--;
  if(cooldown < 0){
    cooldown = 0;
  }
  if(wIsPressed == true){
    bob.accelerate(0.3);
  }
  if(sIsPressed == true){
    bob.accelerate(-0.3);
  }
  if(dIsPressed == true){
    bob.sideAcceleration(0.2);
  }
  if(aIsPressed == true){
    bob.sideAcceleration(-0.2);
  }
}

public void keyPressed(){
  if(key == 'w'){
    wIsPressed = true;
  }
  if(key == 's'){
    sIsPressed = true;
  }
  if(key == 'd'){
    dIsPressed = true;
  }
  if(key == 'a'){
    aIsPressed = true; 
  }
  if(cooldown == 0){
  if(key == 'h'){
    bob.hyperspace();
    cooldown = 60;
  }
  if(key == 'W'){
    bob.dash(0,-100);
    cooldown = 45;
  }
  if(key == 'S'){
    bob.dash(0,100);
    cooldown = 45;
  }
  if(key == 'A'){
    bob.dash(-100,0);
    cooldown = 45;
  }
  if(key == 'D'){
    bob.dash(100,0);
    cooldown = 45;
  }
  }
}

public void keyReleased(){
  if(key == 'w'){
    wIsPressed = false;
  }
  if(key == 's'){
    sIsPressed = false;
  }
  if(key == 'd'){
    dIsPressed = false;
  }
  if(key == 'a'){
    aIsPressed = false;
  }
}

public void mouseMoved(){
}
