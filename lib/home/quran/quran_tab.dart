import 'package:flutter/material.dart';
import 'package:islamy/home/quran/quran_details_screen.dart';
import 'package:islamy/model/sura_model.dart';
import 'package:islamy/providers/app_configure_provider.dart';
import 'package:islamy/providers/quran_provider.dart';
import 'package:islamy/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var quranProvider = Provider.of<QuranProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/qur2an_screen_logo.png',
          ),
        ),
        Divider(
          color: provider.themeMode == ThemeMode.light
              ? MyTheme.primaryColor
              : MyTheme.yellowColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.sura_name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color: provider.themeMode == ThemeMode.light
              ? MyTheme.primaryColor
              : MyTheme.yellowColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: suraNames.length,
            itemBuilder: (context, index) => Center(
                child: GestureDetector(
                    onTap: () {
                      quranProvider.loadFiles(index, suraNames[index]);
                    Navigator.of(context).pushNamed(QuranDetailsScreen.routeName);},
                    child: Text(
                      suraNames[index],
                      style: Theme.of(context).textTheme.bodySmall,
                    ))),
          ),
        ),
      ],
    );
  }
}
