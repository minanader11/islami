
import 'package:flutter/material.dart';
import 'package:islamy/theme.dart';

class AppConfigProvider extends ChangeNotifier
{
String appLanguage= 'en';
ThemeMode themeMode=ThemeMode.light;
void ChangeLanguage(String newLanguage){
 if(newLanguage== appLanguage){
   return;
 }
 appLanguage= newLanguage;
 notifyListeners();
}
void changeTheme(ThemeMode newTheme){
  if(newTheme== themeMode){
    return;
  }
  themeMode=newTheme;
  notifyListeners();
}

}