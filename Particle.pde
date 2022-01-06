class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  int maxSpeed;
  PVector prevPos;
  int partRed = floor(random(255));
  int partGreen = floor(random(255));
  int partBlue = floor(random(255));
  color particleColor = color(partRed, partGreen, partBlue);
  float colorInc = 0.05;
  
  
  
  Particle(){
    this.pos = new PVector(random(500, 700),random(375,425));
    this.vel = new PVector(0,0);
    this.acc = new PVector(0,0);
    this.maxSpeed = 4;
    this.prevPos = this.pos.copy();
  }
  
  void update(){
    this.vel.add(acc);
    this.pos.add(vel);
    this.vel.limit(this.maxSpeed);
    this.acc.mult(0);
    partRed += colorInc;
    partGreen += colorInc;
    partBlue += colorInc;
    this.particleColor = color(floor(noise(partRed)*255), floor(noise(partGreen)*255), floor(noise(partBlue)*255));
    
    if (this.pos.x > width) {
      this.pos.x = 0;
      this.updatePrev();
    }
    if (this.pos.x < 0) {
      this.pos.x = width;
      this.updatePrev();
    }
    if (this.pos.y > height) {
      this.pos.y = 0;
      this.updatePrev();
    }
    if (this.pos.y < 0) {
      this.pos.y = height;
      this.updatePrev();
    }
  }
  
  void updatePrev(){
    this.prevPos.x = this.pos.x;
    this.prevPos.y = this.pos.y;
  }
  
  void follow(PVector[] ff){
    int x = floor(this.pos.x/scl);
    int y = floor(this.pos.y/scl);
    if (y < rows && x < cols){
      int index = x + y*cols;
      PVector force = ff[index];
      this.applyForce(force);
    }
  }
  
  void applyForce(PVector force){
    this.acc.add(force);
  }
  
  void show(){
    stroke(50, 150, 255, 5);
    strokeWeight(1);
    //point(this.pos.x, this.pos.y);
    line(this.pos.x, this.pos.y, this.prevPos.x, this.prevPos.y);
    this.updatePrev();
  }
}
