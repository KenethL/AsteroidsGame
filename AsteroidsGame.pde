//your variable declarations here
Spaceship bob = new Spaceship();
Star[] daves = new Star[100];
private int cooldown = 0;
private boolean wIsPressed, dIsPressed = false;
private boolean sIsPressed, aIsPressed = false;
public void setup() 
{
  size(500, 500);
  for(int i = 0; i < daves.length; i++){
    daves[i] = new Star();
  }
}
public void draw() 
{
  background(0);
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
  for(int i = 0; i < daves.length; i++){
    daves[i].show();
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
