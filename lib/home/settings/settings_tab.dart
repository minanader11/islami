import 'package:flutter/material.dart';
import 'package:islamy/home/settings/LanguageBottomSheet.dart';
import 'package:islamy/home/settings/ThemeBottomSheet.dart';
import 'package:islamy/model/sura_model.dart';
import 'package:islamy/providers/app_configure_provider.dart';
import 'package:islamy/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
                decoration: BoxDecoration(
                    color: provider.themeMode == ThemeMode.light
                        ? MyTheme.primaryColor
                        : MyTheme.yellowColor,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                      style: provider.themeMode == ThemeMode.light
                          ? Theme.of(context).textTheme.bodyMedium
                          : Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: MyTheme.blackColor),),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Text(AppLocalizations.of(context)!.theme),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
                decoration: BoxDecoration(
                    color: provider.themeMode == ThemeMode.light
                        ? MyTheme.primaryColor
                        : MyTheme.yellowColor,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.themeMode == ThemeMode.light
                          ? AppLocalizations.of(context)!.light
                          : AppLocalizations.of(context)!.dark,
                      style: provider.themeMode == ThemeMode.light
                          ? Theme.of(context).textTheme.bodyMedium
                          : Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: MyTheme.blackColor),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeBottomSheet();
      },
    );
  }
}
