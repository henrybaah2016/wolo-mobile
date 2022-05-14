import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kdemy/Locale/change_language.dart';
import 'package:kdemy/Locale/locales.dart';
import 'package:kdemy/splash/splash.dart';
import 'Routes/routes.dart';
import 'Theme/styles.dart';
import 'language_cubit.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(Phoenix(child: kdemy()));
  MobileAds.instance.initialize();
}

class kdemy extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageCubit>(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (_, locale) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            // supportedLocales: [
            //   const Locale('en'),
            //   const Locale('ar'),
            //   const Locale('pt'),
            //   const Locale('fr'),
            //   const Locale('id'),
            //   const Locale('es'),
            //   const Locale('tk'),
            //   const Locale('it'),
            //   const Locale('sw'),
            // ],
            locale: locale,
            theme: appTheme,
            home: Splash(),
            routes: PageRoutes().routes(),
          );
        },
      ),
    );
  }
}
