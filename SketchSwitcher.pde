String currentSketch = "";
String welcomeMessage = "Hello!";   //message displayed while the sketch isn't selected or when switching between sketches


void setup() {
 fullScreen();
 
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

void closeSketch(){
  PrintWriter output=null;
  output = createWriter("closeSketch.bat");
  output.println("taskkill /FI \"WINDOWTITLE eq " + currentSketch + "\" /F");
  output.flush();
  output.close();
  output=null;
  launch(sketchPath("") + "closeSketch.bat");
  
}
