import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/model/hadeth_model.dart';

class HadethProvider extends ChangeNotifier{
  String content='';
  List<String> hadethLines=[]; // ahadeth total
  List<String> hadethContent=[]; // hadeth content only
  Hadeth hadeth= Hadeth(hadethName: '', hadethContent: []);
  void loadFiles(int index,String hadethName)async{

    content= await rootBundle.loadString('assets/texts/hadeth/ahadeth.txt');
   hadethLines = content.split('#\r\n');
   hadethContent=hadethLines[index].split('\n');
hadeth.hadethName=hadethContent[0];


    hadethContent.removeAt(0);
    hadeth.hadethContent=hadethContent;


    notifyListeners();
  }
}