
Translator morse;

public void settings(){
  size(400,400);
  
}



void setup(){
  morse = new Translator("morse_dict.txt");
}

void draw(){
  textSize(32);
  fill(11);
  text("Hello World!",50,50);
}
