Particle[] stars = new Particle[50];

void setup() {
  size(400, 400);
  
  // Creates particles
  for (int i = 0; i < stars.length; i++) {
    if (i == 0) {
      stars[i] = new OddballParticle(); 
    } else {
      stars[i] = new Particle(); 
    }
  }
}

void draw() {
  background(0); // black background
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].move();
    stars[i].show();
  }
}

// super class
class Particle {
  double x, y;        //position 
  double speedX, speedY; 
  color c;
  
  Particle() {
    x = 200; // center
    y = 200;
    
    // spread out movement in random directions
   int speedX = (int)(Math.random() * 7) - 3;
   int speedY = (int)(Math.random() * 7) - 3;
    c = color(255);   }
  
  void move() {
    x = x + speedX;
    y = y + speedY;
  }
  
  void show() {
    fill(c);
    noStroke();
    ellipse((float)x, (float)y, 5, 5);
  }
}

//sub class
class OddballParticle extends Particle {
  
  OddballParticle() {
    x = 200;
    y = 200;
    speedX = 2; 
    speedY = -2;
    c = color(255, 0, 0); 
  }
  
  void move() {
    x = x + speedX;
    y = y + speedY;
    
    if (x > width || x < 0) {
      speedX = -speedX;
    }
    if (y > height || y < 0) {
      speedY = -speedY;
    }
  }
  
  void show() {
    fill(c);
    ellipse((float)x, (float)y, 10, 10);
  }
}
