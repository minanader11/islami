import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/cubit/sebha_cubit.dart';
import 'package:islamy/cubit/sebha_state.dart';
import 'package:islamy/home/sebha/sebha_image.dart';
import 'package:islamy/providers/app_configure_provider.dart';
import 'package:islamy/providers/sebha_provider.dart';
import 'package:islamy/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var Sebhaprovider = Provider.of<SebhaProvider>(context);
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        // Adjust as needed
        children: [
          /*  Padding(
                padding: const EdgeInsets.all(0),
                child: Image.asset('assets/images/head_sebha_logo.png',
                    fit: BoxFit.cover),
              ),
              AnimatedRotation(
                duration: Duration(milliseconds: 100),
                turns: BlocProvider.of<SebhaCubit>(context).turns,
                child: Image.asset(
                  'assets/images/body_sebha_logo.png',
                  fit: BoxFit.fill,
                ),
              ),*/
          Expanded(flex: 1, child: SebhaImage()),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context)!.tasbihat_number,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:provider.themeMode==ThemeMode.light? MyTheme.secondaryColor: MyTheme.primaryColorDarkMode),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('${Sebhaprovider.counter}'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: provider.themeMode==ThemeMode.light? MyTheme.primaryColor:MyTheme.yellowColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Sebhaprovider.increment();
                    },
                    child: Text(
                     Sebhaprovider.tasabih[Sebhaprovider.sebhaIndex] ,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: provider.themeMode==ThemeMode.light? MyTheme.whiteColor:MyTheme.blackColor),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
