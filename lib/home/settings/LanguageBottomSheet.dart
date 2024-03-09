import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/providers/app_configure_provider.dart';
import 'package:islamy/theme.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.themeMode == ThemeMode.light
          ? MyTheme.whiteColor
          : MyTheme.primaryColorDarkMode,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          InkWell(
            onTap: () => provider.ChangeLanguage('en'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: provider.appLanguage == 'en'
                  ? [
                      Text(
                        AppLocalizations.of(context)!.english,
                        style: provider.themeMode == ThemeMode.light
                            ? Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyTheme.primaryColor)
                            : Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: MyTheme.yellowColor),
                      ),
                      Icon(
                        Icons.check,
                        color: provider.themeMode == ThemeMode.light
                            ? MyTheme.primaryColor
                            : MyTheme.yellowColor,
                      )
                    ]
                  : [
                      Text(
                        AppLocalizations.of(context)!.english,
                      )
                    ],
            ),
          ),
          InkWell(
            onTap: () => provider.ChangeLanguage('ar'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: provider.appLanguage == 'ar'
                  ? [
                      Text(AppLocalizations.of(context)!.arabic,
                          style: provider.themeMode == ThemeMode.light
                              ? Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyTheme.primaryColor)
                              : Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: MyTheme.yellowColor)),
                      Icon(
                        Icons.check,
                        color: provider.themeMode == ThemeMode.light
                            ? MyTheme.primaryColor
                            : MyTheme.yellowColor,
                      )
                    ]
                  : [
                      Text(
                        AppLocalizations.of(context)!.arabic,
                      )
                    ],
            ),
          ),
        ]),
      ),
    );
  }
}
