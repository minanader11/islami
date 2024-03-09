import 'package:flutter/material.dart';
import 'package:islamy/providers/app_configure_provider.dart';
import 'package:islamy/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/images/radio_image.png',
        ),
        //SizedBox(height: 30,),
         Text(AppLocalizations.of(context)!.quran_radio),
       // SizedBox(height: 40,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [IconButton(color: provider.themeMode==ThemeMode.light?MyTheme.primaryColor:MyTheme.yellowColor,
            onPressed: () {},
            icon:  Icon(provider.appLanguage == 'en'?
              Icons.skip_previous:Icons.skip_next,size: 50,
            ),
          ),
            IconButton(color:  provider.themeMode==ThemeMode.light?MyTheme.primaryColor:MyTheme.yellowColor,
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow,size: 50,
              ),
            ),IconButton(color:  provider.themeMode==ThemeMode.light?MyTheme.primaryColor:MyTheme.yellowColor,
              onPressed: () {},
              icon:  Icon(provider.appLanguage == 'en'?
                Icons.skip_next: Icons.skip_previous,size: 50,
              ),
            ),
          ],
        )
      ],
    );
  }
}
