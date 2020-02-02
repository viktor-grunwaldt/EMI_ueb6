
Translator morse;
Button button;
String input = "";
String msg = "";
float mid_word_len,ent;
boolean b_pressed = false;

public void settings(){
	size(1280, 720);
}

//calculates middle length of a word
float mid_len(){
	if(msg.length()==0 || input.length()==0)
		return 0.0;
	
	else
		return float(msg.length())/float(input.length());
}
/*
I assumed that spaces do count in the message.
Why wouldn't they?
*/

float log2(int a){
	return (log(a)/log(2));
}

float entropy(){
	int[] charmap = new int[128];  //ascii array
	int diff_chars = 0;
	float entropy_sum = 0;
	for(int i=0;i<input.length();i++)
		charmap[int(input.charAt(i))]++;
	
	for(int i=0;i<128;i++){
		if(charmap[i]!=0){
			diff_chars++;
			entropy_sum+=charmap[i]*log2(charmap[i]);
		}
	}
	return -(entropy_sum - diff_chars*log2(input.length()))/input.length();
}
/*
p_i = n_i/len
Entropy= - (Sum i : n_i/len*log_2(n_i/len))
Entropy= - (Sum i : n_i*(log_2(n_i) - log_2(len)))/len
Entropy= - (Sum i : n_i*log2(n_i)  - i*log2(len) )/len
*/


void calc(){
	msg = morse.encrypt(input);
	b_pressed = true;
	ent = entropy();
	mid_word_len = mid_len();
}

void setup(){
	morse = new Translator("morse_dict.txt");
	button = new Button("ubersetze!",200,100,200,70);
	textSize(32);
	fill(0);
}

void draw(){
	background(192);
	
	button.Draw();
	text(input, 50, 50 , width-100, height-100);
	if(b_pressed){
		text(msg, 50, 200 , width-100, height-100);
		text("Mittlere Wortlaenge: " + str(mid_word_len), 50, 250 , width-100, height-100);
		text("Entropie: " + str(ent), 50, 300 , width-100, height-100);
		text("Redundanz: " + str(mid_word_len - ent), 50, 350 , width-100, height-100);		
	}
}

void keyPressed(){
	if ((key>='a' && key<='z') || (key>='0' && key<='9') || key == ' ')
		input+=key;
	else if (key == BACKSPACE) {
		if(input.length()>0)
			input = input.substring(0,input.length()-1);
	}
	else if (key == ENTER){
		calc();
	}
}

void mousePressed(){
	if(button.MouseIsOver()){
		calc();
	}
}
