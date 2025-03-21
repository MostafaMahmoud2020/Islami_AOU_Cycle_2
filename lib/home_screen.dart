import 'package:flutter/material.dart';
import 'package:islami_aou_cycle2/tabs/ahadeth_tab.dart';
import 'package:islami_aou_cycle2/tabs/quran_tab.dart';
import 'package:islami_aou_cycle2/tabs/sebha_tab.dart';
import 'my_theme_data.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  List <Widget> Tabs=[
    QuranTab(),SebhaTab(),AhadethTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Islami", style: Theme.of(context).textTheme.bodyLarge),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentTab,
              onTap: (index) {
                currentTab = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/quran_tab.png")),
                    label: "Quran",
                    backgroundColor: MyThemeData.primaryColor),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha_tab.png")),
                    label: "Sebha",
                    backgroundColor: MyThemeData.primaryColor),
                BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage("assets/images/ahadeth_tab.png")),
                    label: "Ahadeth",
                    backgroundColor: MyThemeData.primaryColor),
              ]),
          body: Tabs[currentTab],
        )
      ],
    );
  }
}
