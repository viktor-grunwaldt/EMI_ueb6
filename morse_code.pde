
Translator morse;
Button button;
String input = "";
String msg = "";
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
	button.Draw();
	text(input, 50, 50 , width-100, height-100);
	text(msg, 50, 200 , width-100, height-100);
	
}

void keyPressed(){
	if ((key>='a' && key<='z') || (key>='0' && key<='9') || key == ' ')
		input+=key;

}

void mousePressed(){
	if(button.MouseIsOver())
		msg = morse.encrypt(input);
}