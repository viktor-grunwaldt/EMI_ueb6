
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
	textSize(32);
	fill(11);
}

void draw(){
	background(192);
	
	button.Draw();
	text(input, 50, 50 , width-100, height-100);
	text(msg, 50, 200 , width-100, height-100);
	
}

void keyPressed(){
	if ((key>='a' && key<='z') || (key>='0' && key<='9') || key == ' ')
		input+=key;
	else if (key == BACKSPACE) {
		if(input.length()>0)
			input = input.substring(0,input.length()-1);
	}
}

void mousePressed(){
	if(button.MouseIsOver())
		msg = morse.encrypt(input);
}
