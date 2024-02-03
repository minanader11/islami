import 'package:flutter/material.dart';
import 'package:islamy/home/hadeth/hadeth_details_screen.dart';
import 'package:islamy/model/sura_model.dart';
import 'package:islamy/providers/app_configure_provider.dart';
import 'package:islamy/providers/hadeth_provider.dart';
import 'package:islamy/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class HadethTab extends StatelessWidget {
  List<int> hadethNumbers = [];

  HadethTab({super.key}) {
    for (int i = 1; i <= 50; i++) {
      hadethNumbers.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var hadethProvider = Provider.of<HadethProvider>(context);
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/images/hadeth_logo.png',
          ),
        ),
        Divider(
          color:provider.themeMode==ThemeMode.light? MyTheme.primaryColor: MyTheme.yellowColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color:provider.themeMode==ThemeMode.light? MyTheme.primaryColor: MyTheme.yellowColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemCount: hadethNumbers.length,
            itemBuilder: (context, index) => Center(
                child: GestureDetector(
                    onTap: () {
                      hadethProvider.loadFiles(index, '');
                      Navigator.of(context).pushNamed(HadethDetailsScreen.routeName);
                    },
                    child: Text(
                      ' ${hadethNumbers[index]} حديث رقم ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ))),
          ),
        ),
      ],
    );
  }
}
