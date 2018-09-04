Orbit sun;
color c = color(255,255,0);

void setup(){
  size(600,600);
  background(137);
  sun = new Orbit(300, 300, 300);
  sun.addChild().addChild().addChild().addChild().addChild();
}

void draw(){
  loadPixels();
  Orbit next;
  int updatePeriod = 500;
  
  for(int i=0; i<updatePeriod; i++){ 
    next = sun;
    while (next != null){
      next.update();
      if(next.child == null){
        pixels[floor(next.x) + floor(next.y)*width] = c;
        
      }
      next = next.child;
    }
  }

  updatePixels();
}
