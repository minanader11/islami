import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranProvider extends ChangeNotifier{
  String title='';
  String content='';
  List<String>lines=[];
  void loadFiles(int index,String suraName)async{
    title=suraName;
    content= await rootBundle.loadString('assets/texts/sura/${index+1}.txt');
    lines = content.split('\n');

    notifyListeners();
  }
}