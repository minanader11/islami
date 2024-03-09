import 'package:flutter/material.dart';
import 'package:islamy/home/hadeth/hadeth_tab.dart';
import 'package:islamy/home/settings/settings_tab.dart';
import 'package:islamy/home/quran/quran_tab.dart';
import 'package:islamy/home/radio/radio_tab.dart';
import 'package:islamy/home/sebha/sebha_tab.dart';
import 'package:islamy/home/sebha/sebha_image.dart';
import 'package:islamy/providers/app_configure_provider.dart';
import 'package:islamy/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName='HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tapIndex=0;
  List<Widget> tabs=[QuranTab(),HadethTab(),SebhaTab(),RadioTab(),SettingsTab()];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [provider.themeMode==ThemeMode.light?
        Image.asset(
          'assets/images/default_bg.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ):
    Image.asset(
        'assets/images/dark_bg.png',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),body: tabs[tapIndex],
          bottomNavigationBar: Theme(
            data: provider.themeMode== ThemeMode.light? Theme.of(context).copyWith(canvasColor: MyTheme.primaryColor):Theme.of(context).copyWith(canvasColor: MyTheme.primaryColorDarkMode),
            child: BottomNavigationBar(onTap: (value) {
               tapIndex=value;
               setState(() {

               });
            },currentIndex: tapIndex,items:  [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/icon_quran.png',
                    ),size: 30,
                  ),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png'),size: 30,),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/icon_sebha.png',
                    ),size: 30,
                  ),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/icon_radio.png',
                    ),size: 30,
                  ),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),


                  label: AppLocalizations.of(context)!.settings),
            ]),
          ),
        ),
      ],
    );
  }
}
