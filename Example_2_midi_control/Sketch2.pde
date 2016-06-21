class Sketch2 implements Sketch {

  // private variables are only visible inside this class.
  private int n;
  private int x;
  private String status = "Sketch2";

  // constructor - initialise the sketch here
  public Sketch2(int _i) {
    x = 0;
    n = _i;
    status = status + "(" + str(n) + ")";
  }
   
  private void update() {
    x+=n;
  }
  
  private void draw() {
    
    // Implement what we want to draw here
    
    background(0);
    strokeWeight(5);
    stroke(255);
    
    // get the fill colours (r,g,b) from the LPD-8's (K1, K2, K3) knobs
    // These values are in the range 0-1, so we scale up to 0-255.
    fill(255*ctrl.k[0], 255*ctrl.k[1], 255*ctrl.k[2]);
    
    for (int i=0; i<n; i++) {
      ellipse(width/2,height/2,frameCount%(150/(i+1)), frameCount%(200/(i+1)));
    }  
  }
   
  public String status() {
    return status;
  }

  public void run() {
    update();
    draw();
  }
  
}