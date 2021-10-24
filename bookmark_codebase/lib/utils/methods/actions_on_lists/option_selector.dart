void optionSelector(List<bool> options, int selectedIndex){
  int leng = options.length;
  for(int i = 0 ; i < leng ; i++){
    if(i==selectedIndex){
      options[i]=true;
    }else{
      options[i]=false;
    }

  }


}