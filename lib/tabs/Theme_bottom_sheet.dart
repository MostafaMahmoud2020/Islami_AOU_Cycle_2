import 'package:flutter/material.dart';
import 'package:islami_aou_cycle2/my_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_aou_cycle2/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25,horizontal: 10),
      height: MediaQuery.of(context).size.height*.3,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              pro.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.light),
                Spacer(),
                pro.modeApp==ThemeMode.light?Icon(Icons.done):Container()
              ],
            ),
          ),
          SizedBox(height: 15,),
          Divider(color: MyThemeData.primaryColor,
            indent: 80,endIndent: 80,),
          SizedBox(height: 15,),
          InkWell(
            onTap: () {
              pro.changeTheme(ThemeMode.dark);
              Navigator.pop(context);

            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.dark),
                Spacer(),
                pro.modeApp==ThemeMode.light?Container():Icon(Icons.done)
              ],
            ),
          )
        ],
      ),
    );
  }
}
