
import 'package:flutter/material.dart';
import 'package:islami_aou_cycle2/my_theme_data.dart';
import 'package:islami_aou_cycle2/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25,horizontal: 10),
      height: MediaQuery.of(context).size.height*.3,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              pro.changeLanguage("en");
              Navigator.pop(context);

            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.english),
                Spacer(),
                pro.languageCode=="en"?Icon(Icons.done):Container()
              ],
            ),
          ),
          SizedBox(height: 15,),
          Divider(color: MyThemeData.primaryColor,
          indent: 80,endIndent: 80,),
          SizedBox(height: 15,),
          InkWell(
            onTap:
            () {
              pro.changeLanguage("ar");
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.arabic),
                Spacer(),
                pro.languageCode=="en"?Container():Icon(Icons.done)
              ],
            ),
          )
        ],
      ),
    );
  }
}
