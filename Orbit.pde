class Orbit {
  int DESIRED_VERTICIES = 6;
  float x;
  float y;
  float r;
  float speed;
  float angle = 0;

  Orbit parent;
  Orbit child = null;

  Orbit(float x_, float y_, float r_, float s, Orbit p) {
    x = x_;
    y = y_;
    r = r_;
    parent = p;
    speed = s;
  }

  Orbit(float x_, float y_, float r_) {
    this(x_, y_, r_, 0.000005, null);
  }

  void update() {
    if (parent != null) {
      angle += speed;
      float rsum = r + parent.r - r - r;
      x = parent.x + rsum * cos(angle);
      y = parent.y + rsum * sin(angle);
    }
  }

  void show() {
    stroke(255);
    strokeWeight(2);
    ellipse(x, y, r*2, r*2);
  }

  Orbit addChild() {
    float newR = r/3.0;
    float newX = x + r - newR;
    float newY = y;
    child = new Orbit(newX, newY, newR, -(DESIRED_VERTICIES-1)*this.speed, this);
    return child;
  }
}
