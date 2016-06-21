class Sketch3 implements Sketch {

  // private variables are only visible inside this class.
  private int n;
  private int x;
  private String status = "Sketch2";

  // constructor - initialise the sketch here
  public Sketch3(int _i) {
    x = 0;
    n = _i;
    status = status + "(" + str(n) + ")";
  }
   
  private void update() {
    x+=n;
  }
  
  private void draw() {
    
    // Implement what we want to draw here
    
    //Your value doesn't decrease based on someone's inability to see your worth.
    
    background(1+x);
    strokeWeight(3);
    stroke(255);
    fill(1+x, 0, 0);
    
    // get the fill colours (r,g,b) from the LPD-8's (K1, K2, K3) knobs
    // These values are in the range 0-1, so we scale up to 0-255.
    
    
    for (int i=0; i<n; i++) {
      ellipse(width/2,height/2,frameCount%(300/(i+1)), frameCount%(600/(i+1)));
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