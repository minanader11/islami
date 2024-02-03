import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/providers/app_configure_provider.dart';
import 'package:islamy/theme.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

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
            onTap: () => provider.changeTheme(ThemeMode.light),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: provider.themeMode== ThemeMode.light
                  ? [
                      Text(AppLocalizations.of(context)!.light,
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
                        AppLocalizations.of(context)!.light,
                      )
                    ],
            ),
          ),
          InkWell(
            onTap: () => provider.changeTheme(ThemeMode.dark),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: provider.themeMode== ThemeMode.dark
                  ? [
                      Text(AppLocalizations.of(context)!.dark,
                          style: provider.themeMode == ThemeMode.light
                              ? Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyTheme.primaryColor)
                              : Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith( color: provider.themeMode == ThemeMode.light
                              ? MyTheme.primaryColor
                              : MyTheme.yellowColor,)),
                      Icon(
                        Icons.check,
                        color: provider.themeMode == ThemeMode.light
                            ? MyTheme.primaryColor
                            : MyTheme.yellowColor,
                      )
                    ]
                  : [
                      Text(
                        AppLocalizations.of(context)!.dark,
                      )
                    ],
            ),
          ),
        ]),
      ),
    );
  }
}
