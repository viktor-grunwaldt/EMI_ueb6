
Translator morse;
Button button;
public void settings(){
  size(1280, 720);
  
}



void setup(){
  morse = new Translator("morse_dict.txt");
  button = new Button("ubersetze!",200,100,200,70);
}

void draw(){
  textSize(32);
  fill(11);
  String msg = morse.decrypt("Hello World");
  text(msg, 50, 50 , width-100, height-100);
  button.Draw();
}
