import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/cubit/sebha_cubit.dart';
import 'package:islamy/cubit/sebha_state.dart';
import 'package:islamy/providers/app_configure_provider.dart';
import 'package:islamy/providers/sebha_provider.dart';
import 'package:islamy/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class SebhaImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var Sebhaprovider = Provider.of<SebhaProvider>(context);
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(alignment: Alignment.center, children: [
      Align(
          alignment: Alignment.topCenter,
          child:provider.themeMode==ThemeMode.light? Image.asset('assets/images/head_sebha_logo.png'):Image.asset('assets/images/head_sebha_dark.png')),
      Positioned(
        top: 75,
        child: Align(
          alignment: Alignment.topCenter,
          child:  GestureDetector(onTap: () => Sebhaprovider.increment(),
            child: AnimatedRotation(
              duration: Duration(milliseconds: 100),
              turns: Sebhaprovider.turns,
              child:provider.themeMode==ThemeMode.light? Image.asset(
                'assets/images/body_sebha_logo.png',
                fit: BoxFit.fill,
              ):Image.asset(
                'assets/images/body_sebha_dark.png',
                fit: BoxFit.fill,
              )
            ),
          ),
        ),
      ),
    ]);
  }
}
