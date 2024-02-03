import 'package:flutter/material.dart';
import 'package:islamy/providers/app_configure_provider.dart';
import 'package:islamy/providers/quran_provider.dart';
import 'package:islamy/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranDetailsScreen extends StatelessWidget {
  static const String routeName = 'QuranDetailsScreen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var quranProvider = Provider.of<QuranProvider>(context);
    return Stack(children: [
      provider.themeMode == ThemeMode.light
          ? Image.asset(
              'assets/images/default_bg.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/images/dark_bg.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
      quranProvider.title == '' || quranProvider.content == []
          ? Scaffold(
              appBar: AppBar(
                title: Text(
                  quranProvider.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              body: Center(
                child: CircularProgressIndicator(
                    color: provider.themeMode == ThemeMode.light
                        ? MyTheme.primaryColor
                        : MyTheme.yellowColor),
              ),)
          : Scaffold(
              appBar: AppBar(
                title: Text(
                  quranProvider.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              body: Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.sizeOf(context).height * 0.05,
                    horizontal: MediaQuery.sizeOf(context).width * 0.05),
                decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.luminosity,
                    borderRadius: BorderRadius.circular(20),
                    color: provider.themeMode == ThemeMode.light
                        ? MyTheme.whiteColor
                        : MyTheme.primaryColorDarkMode),
                child: ListView.builder(
                  itemCount: quranProvider.lines.length,
                  itemBuilder: (context, index) => Text(
                    ' ${quranProvider.lines[index]} (${index + 1})',
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: provider.themeMode == ThemeMode.light
                        ? Theme.of(context).textTheme.bodyMedium
                        : Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: MyTheme.yellowColor),
                  ),
                ),
              ),
            )
    ]);
  }
}
