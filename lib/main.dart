import 'package:flutter/material.dart';
import 'package:islami_aou_cycle2/ahadeth_screen.dart';
import 'package:islami_aou_cycle2/home_screen.dart';
import 'package:islami_aou_cycle2/my_theme_data.dart';
import 'package:islami_aou_cycle2/sura_details_screen.dart';

main() {
  runApp(MyAPP());
}

class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (BuildContext) => HomeScreen(),
       SuraDetailsScreen.routeName:(BuildContext) =>SuraDetailsScreen(),
        AhadethScreen.routeName:(BuildContext) => AhadethScreen()

      },
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme ,
    );
  }
}
