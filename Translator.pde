class Translator{
  StringDict  Alphabet;
  
  Translator(String f){
    //importing the alphabet
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
  
  String decrypt(String s){
    String message= null;
    for(int i=0;i<s.length();i++){
      char c=s.charAt(i);
      if((c>='a' && c<='z') || (c>='0' && c<='9') ){
        message+=Alphabet.get(str(c))+" ";
      }
      else return -1;
    }
    return 0;
  }
}
