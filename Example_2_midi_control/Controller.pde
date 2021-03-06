
/* This class processes MIDI messages
   from the Akai LPD-8 controller.
   For other devices, you'll need to modify the code.
   
   Data will be available in the arrays 'k' and 'cc'
*/

public class Controller {
  
  MidiBus myBus = new MidiBus(this, 0, "Java Sound Synthesizer");

  // knob values
  public float[] k  = new float[8];
  
  // Control Change values
  public int[] cc = new int[8];
  
  // message data
  public int msg;
  public boolean UPDATE;
 
  public Controller() {
    UPDATE=false;
  }
  
  void noteOn(Note note) {
  // Receive a noteOn
  //println();
  //println("Note On:");
  println("--------");
  //println("Channel:"+note.channel());
  println("Pitch:"+note.pitch());
  println("Velocity:"+note.velocity());
}
  
  void midiMessage(MidiMessage message) {
    
    int value;
    int status = message.getStatus();
    
    UPDATE=false;
    
    if (status == 176) {      // controller change ("CC")
    
      msg = (int)(message.getMessage()[1] & 0xFF);
      value = (int)(message.getMessage()[2] & 0xFF);
      
      if (msg >= 11 & msg <= 18) {
        
        // store the values in the range 0..1
        k[msg-11] = map(value, 0, 127, 0.0, 1.0);
        
        // or if we prefer, we could store the original 0-127 MIDI range
        //k[msg-11] = constrain(value, 0, 127);
        
      } else if (msg >= 1 & msg <= 8) {
        
        // a pad hit in CONTROLLER CHANGE
        cc[msg-1] = value;//(value > 0) ? 1 : 0;
      }
  
    } else if (status == 192) { // program change ("PROG CHNG")
    
      // this can be a momentary signal (PROGRAM CHANGE 192), or multiples 
      // (e.g. pad down, pad up, CONTROLLER CHANGE 176 (see above))
      // in the latter case, there is a pressure value in param 3 (0-127)
      msg = message.getMessage()[1] & 0xFF;

      UPDATE=true;

    }
  } 
}