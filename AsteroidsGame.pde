//your variable declarations here
Spaceship bob = new Spaceship();
Star[] daves = new Star[250];
ArrayList <Asteroid> jacobs = new ArrayList <Asteroid>();
ArrayList <Bullet> dew = new ArrayList <Bullet>();
ArrayList <BigBullet> pow = new ArrayList<BigBullet>();
private int cooldown, score = 0;
private int bulletCooldown = 0;
private int spawnTime = 60;
private boolean wIsPressed, dIsPressed, eIsPressed = false;
private boolean sIsPressed, aIsPressed, mouseIsPressed = false;
public void setup() 
{
  size(1000, 800);
  for (int i = 0; i < daves.length; i++) {
    daves[i] = new Star();
  }
  for (int i = 0; i < 14; i++) {
    jacobs.add(new Asteroid(18));
  }
}
public void draw() 
{
  background(0);
  for (int i = 0; i < daves.length; i++) {
    daves[i].show();
  }
  for (int i = 0; i < jacobs.size(); i++) {
    jacobs.get(i).show();
    jacobs.get(i).move();
    if (dist((float)jacobs.get(i).getMyCenterX(), (float)jacobs.get(i).getMyCenterY(), (float)bob.getMyCenterX(), (float)bob.getMyCenterY()) < 5*jacobs.get(i).getMySize()) {
      jacobs.add(new Asteroid((jacobs.get(i).getMySize()/3), jacobs.get(i).getMyCenterX()+(Math.random()*100-50), jacobs.get(i).getMyCenterY()+(Math.random()*100-50)));
      jacobs.add(new Asteroid((jacobs.get(i).getMySize()/3), jacobs.get(i).getMyCenterX()+(Math.random()*100-50), jacobs.get(i).getMyCenterY()+(Math.random()*100-50)));
      jacobs.add(new Asteroid((jacobs.get(i).getMySize()/3), jacobs.get(i).getMyCenterX()+(Math.random()*100-50), jacobs.get(i).getMyCenterY()+(Math.random()*100-50)));
      jacobs.remove(i);
      i--;
    } else if (jacobs.get(i).getMySize() <= 1) {
      jacobs.remove(i);
      i--;
    }
  }
  for (int i = 0; i < dew.size(); i++) {
    dew.get(i).show();
    dew.get(i).move();
    dew.get(i).changeMyLife(-1);
    for (int a = 0; a < jacobs.size(); a++) {
      if(dew.size() > 0 && jacobs.size() > 0){
      if (dist((float)jacobs.get(a).getMyCenterX(), (float)jacobs.get(a).getMyCenterY(), (float)dew.get(i).getMyCenterX(), (float)dew.get(i).getMyCenterY()) < 5*jacobs.get(a).getMySize()) {
        score = score + jacobs.get(a).getMySize();
        jacobs.add(new Asteroid((jacobs.get(a).getMySize()/3), jacobs.get(a).getMyCenterX()+(Math.random()*100-50), jacobs.get(a).getMyCenterY()+(Math.random()*100-50)));
        jacobs.add(new Asteroid((jacobs.get(a).getMySize()/3), jacobs.get(a).getMyCenterX()+(Math.random()*100-50), jacobs.get(a).getMyCenterY()+(Math.random()*100-50)));
        jacobs.add(new Asteroid((jacobs.get(a).getMySize()/3), jacobs.get(a).getMyCenterX()+(Math.random()*100-50), jacobs.get(a).getMyCenterY()+(Math.random()*100-50)));
        dew.remove(i);
        jacobs.remove(a);
        a--;
        if(i >=dew.size()){
        i--;
        }
        if(i < 0){
         i++;
        }
      }
    }
    }
    if(dew.size() > 0){
    if(dew.get(i).getMyLife() < 0){
      dew.remove(i);
    }
    }
  }
  for(int i = 0; i < pow.size(); i++){
    pow.get(i).move();
    pow.get(i).show();
    pow.get(i).changeMyLife(-1);
    if(pow.get(i).getMyLife() < 0){
      pow.remove(i);
      break;
    }
    for(int a = 0; a < jacobs.size(); a++){
    if (dist((float)jacobs.get(a).getMyCenterX(), (float)jacobs.get(a).getMyCenterY(), (float)pow.get(i).getMyCenterX(), (float)pow.get(i).getMyCenterY()) < 5*jacobs.get(a).getMySize()) {
      score = score + jacobs.get(a).getMySize();
      jacobs.add(new Asteroid((jacobs.get(a).getMySize()/3), jacobs.get(a).getMyCenterX()+(Math.random()*100-50), jacobs.get(a).getMyCenterY()+(Math.random()*100-50)));
      jacobs.add(new Asteroid((jacobs.get(a).getMySize()/3), jacobs.get(a).getMyCenterX()+(Math.random()*100-50), jacobs.get(a).getMyCenterY()+(Math.random()*100-50)));
      jacobs.add(new Asteroid((jacobs.get(a).getMySize()/3), jacobs.get(a).getMyCenterX()+(Math.random()*100-50), jacobs.get(a).getMyCenterY()+(Math.random()*100-50)));
      jacobs.remove(a);
      break;
  }
    }
  }
  bob.move();
  bob.show();
  bob.setMyPointDirection(mouseX, mouseY);
  bob.speedCap();
  cooldown--;
  bulletCooldown--;
  spawnTime--;
  if (cooldown < 0) {
    cooldown = 0;
  }
  if (wIsPressed == true) {
    bob.accelerate(0.3);
  }
  if (sIsPressed == true) {
    bob.accelerate(-0.3);
  }
  if (dIsPressed == true) {
    bob.sideAcceleration(0.2);
  }
  if (aIsPressed == true) {
    bob.sideAcceleration(-0.2);
  }
  if (mouseIsPressed == true) {
    if(bulletCooldown <= 0){
    dew.add(new Bullet(bob));
    bulletCooldown = 5;
    }
  }
 if(eIsPressed == true){
   if(bulletCooldown <= 0){
     pow.add(new BigBullet(bob));
     bulletCooldown = 60;
   }
 }
  if(spawnTime <= 0){
    jacobs.add(new Asteroid(18));
    spawnTime = 60;
  }
  fill(100,100,250);
  textSize(20);
  text("Score: " + score, 450,20);
}

public void keyPressed() {
  if (key == 'w') {
    wIsPressed = true;
  }
  if (key == 's') {
    sIsPressed = true;
  }
  if (key == 'd') {
    dIsPressed = true;
  }
  if (key == 'a') {
    aIsPressed = true;
  }
  if(key == 'e'){
    eIsPressed = true;
    }
  if (cooldown == 0) {
    if (key == 'h') {
      bob.hyperspace();
      cooldown = 60;
    }
    if (key == 'W') {
      bob.dash(0, -100);
      cooldown = 45;
    }
    if (key == 'S') {
      bob.dash(0, 100);
      cooldown = 45;
    }
    if (key == 'A') {
      bob.dash(-100, 0);
      cooldown = 45;
    }
    if (key == 'D') {
      bob.dash(100, 0);
      cooldown = 45;
    }
  }
}

public void keyReleased() {
  if (key == 'w') {
    wIsPressed = false;
  }
  if (key == 's') {
    sIsPressed = false;
  }
  if (key == 'd') {
    dIsPressed = false;
  }
  if (key == 'a') {
    aIsPressed = false;
  }
  if (key == 'e'){
    eIsPressed = false;
  }
}

public void mousePressed() {
  mouseIsPressed = true;
}

public void mouseReleased() {
  mouseIsPressed = false;
}
