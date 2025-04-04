import 'package:flutter/material.dart';
import 'package:islami_aou_cycle2/ahadeth_screen.dart';
import 'package:islami_aou_cycle2/home_screen.dart';
import 'package:islami_aou_cycle2/my_theme_data.dart';
import 'package:islami_aou_cycle2/providers/my_provider.dart';
import 'package:islami_aou_cycle2/sura_details_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) =>MyProvider(),
      child: MyAPP()));
}

class MyAPP extends StatelessWidget {
  late MyProvider pro;

  @override
  Widget build(BuildContext context) {
 pro =Provider.of<MyProvider>(context);
 getSharedPreferences();
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(pro.languageCode),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (BuildContext) => HomeScreen(),
        SuraDetailsScreen.routeName: (BuildContext) => SuraDetailsScreen(),
        AhadethScreen.routeName: (BuildContext) => AhadethScreen()
      },
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: pro.modeApp,
    );
  }

  getSharedPreferences()async{
    SharedPreferences prefs= await  SharedPreferences.getInstance();
    String lang= prefs.getString("lang")??"en";
    String theme= prefs.getString("theme")??"light";
    pro.changeLanguage(lang);
    pro.changeTheme(theme=="light"?ThemeMode.light:ThemeMode.dark);

  }
}
