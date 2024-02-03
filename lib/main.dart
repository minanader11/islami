import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/cubit/sebha_cubit.dart';
import 'package:islamy/home/home_screen.dart';
import 'package:islamy/home/hadeth/hadeth_details_screen.dart';
import 'package:islamy/home/quran/quran_details_screen.dart';
import 'package:islamy/providers/app_configure_provider.dart';
import 'package:islamy/providers/hadeth_provider.dart';
import 'package:islamy/providers/quran_provider.dart';
import 'package:islamy/providers/sebha_provider.dart';
import 'package:islamy/splash_screen.dart';
import 'package:islamy/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppConfigProvider(),),
    ChangeNotifierProvider(create: (context) => SebhaProvider(),),
    ChangeNotifierProvider(create: (context) => QuranProvider(),),
    ChangeNotifierProvider(create: (context) => HadethProvider(),),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      home: SplashScreen(),
      routes:{
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranDetailsScreen.routeName: (context) => QuranDetailsScreen(),
        HadethDetailsScreen.routeName:(context) => HadethDetailsScreen(),
      } ,
      theme: MyTheme.lightMode,
      themeMode: provider.themeMode,
      darkTheme:  MyTheme.darkMode,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
