class Translator{
	private StringDict  Alphabet;

	Translator(String f){
		//importing the alphabet
		Alphabet = new StringDict();
		BufferedReader reader = createReader(f);
		String line = null;
		try{
			while((line = reader.readLine()) != null){
				String[] pieces = split(line,TAB);
				Alphabet.set(pieces[0],pieces[1]);
			}
			reader.close();
		}
		catch (IOException e){
			e.printStackTrace();
		}
	}

	String encrypt(String s){
		if(s.length() == 0)
			return "";

		String message = "";
		s=s.toLowerCase();
		for(int i=0;i<s.length();i++){
			char c=s.charAt(i);
			
			if((c>='a' && c<='z') || (c>='0' && c<='9') )
				message+=Alphabet.get(str(c))+" ";
			
			else if(c == ' ')
				message+="   ";
			
			else 
				return "ERROR: illegal character: "+ str(c);
			
		}
		return message;
	}
}
