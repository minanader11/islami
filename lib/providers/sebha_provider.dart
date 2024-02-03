

import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier{
  int counter=0;
  List<String> tasabih=['سبحان الله','الحمد لله','الله اكبر'];
  int sebhaIndex= 0;
  double turns=0;
  void increment(){
    counter++;
    turns=turns -1/100;

    if(counter%33==0){
      sebhaIndex++;

      print('1');
    }
    if(counter==99){
      counter=0;
      sebhaIndex=0;
    }
    notifyListeners();
}
}