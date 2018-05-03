import hypermedia.net.*;

UDP udp;
byte[] data;
int port = 6100; //Define the port you are expecting to receive the messages

String currentSketch = "";
String welcomeMessage = "Hello!";   //message displayed while the sketch isn't selected or when switching between sketches


void setup() {
  fullScreen();
   
  udp = new UDP(this, port);
  udp.listen(true);
}


void draw() {
  background(0);
  
  fill(255);
  textSize(140);
  text(welcomeMessage, 310, 380);
  
}


void openSketch() {
  PrintWriter output=null;
  output = createWriter("openSketch.bat");
  output.println("cd " + sketchPath("") + currentSketch);
  output.println("start \""+currentSketch+"\" " + currentSketch + ".exe");
  output.flush();
  output.close();
  output=null;
  launch(sketchPath("") + "openSketch.bat");
  
}


void closeSketch() {
  PrintWriter output=null;
  output = createWriter("closeSketch.bat");
  output.println("taskkill /FI \"WINDOWTITLE eq " + currentSketch + "\" /F");
  output.flush();
  output.close();
  output=null;
  launch(sketchPath("") + "closeSketch.bat");
  
}


void receive(byte[] data) {
  String message = new String(data);
  println(message);
  
  if(!message.equals(currentSketch)){
     closeSketch();
     currentSketch = message;
     openSketch();
  }
}
