class Button {
	String label;
	float x;
	float y;
	float w;
	float h;
	
	Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
	 	label = labelB;
	 	x = xpos;
	 	y = ypos;
	 	w = widthB;
	 	h = heightB;
	}
	
	void Draw() {
	 	fill(218);
	 	stroke(141);
	 	rect(x, y, w, h, 10);
	 	textAlign(CENTER, CENTER);
	 	fill(0);
	 	text(label, x + (w / 2), y + (h / 2));
		textAlign(TOP, LEFT);
}
	
	boolean MouseIsOver() {
	 	if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h))
	 	  return true;

	 	return false;	
	}
}
