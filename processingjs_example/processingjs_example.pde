interface PNaClCsound {
   void Event(String val);
   void SetChannel(String channelName, float value); 
}

PnaclCsound csound;

void bindCsound(PNaClCsound cs) {
     csound = cs;
}

class TouchPoint {
    int x, y, radius;
    int MAX_RADIUS = 20;
    boolean active; 
    
    void update() {
      if(active && radius < MAX_RADIUS) {
         radius++; 
      } else if(!active && radius > 0) {
         radius--; 
      }
    }
    
    void draw() {
      stroke(#00FF00);      // set the default shape outline colour
      fill(#CCFFCC);        // set the default shape fill colour

      ellipse(x, y, radius, radius);
    }
}

TouchPoint t = new TouchPoint();

void mousePressed() {
   t.active = true; 
   t.x = mouseX;
   t.y = mouseY;
   
   
   if(csound != null) {
      csound.Event("i1 0 -1"); 
      csound.SetChannel("x", mouseX / 800);
      csound.SetChannel("y", 1 - (mouseY / 600));
   }
   
}

void mouseReleased() {
   t.active = false; 
   csound.Event("i-1 0 1"); 

}

void mouseDragged() {
   t.x = mouseX;
   t.y = mouseY;
   
   if(csound != null) {
       csound.SetChannel("x", mouseX / 800);
       csound.SetChannel("y", 1 - (mouseY / 600));
   }
}

void setup() {
  size(800,600);
  
  t.x = 20;
  t.y = 20;
  t.radius = 10;
}

void draw() {
  t.update();
  background(#000000);
  t.draw();
}
