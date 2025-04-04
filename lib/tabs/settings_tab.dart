import 'package:flutter/material.dart';
import 'package:islami_aou_cycle2/language_bottom_sheet.dart';
import 'package:islami_aou_cycle2/my_theme_data.dart';
import 'package:islami_aou_cycle2/providers/my_provider.dart';
import 'package:islami_aou_cycle2/tabs/Theme_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language),
          InkWell(
            onTap: () => showBottomSheetLanguage(context),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55),
                  border:
                      Border.all(width: 2, color: MyThemeData.primaryColor)),
              child: Row(
                children: [
                  pro.languageCode=="en"?Text(AppLocalizations.of(context)!.english):
                  Text(AppLocalizations.of(context)!.arabic),
                  Spacer(),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(AppLocalizations.of(context)!.appearance),
          InkWell(
            onTap: () => showBottomSheetTheme(context),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55),
                  border:
                      Border.all(width: 2, color: MyThemeData.primaryColor)),
              child: Row(
                children: [
                  pro.modeApp==ThemeMode.light?
                  Text(AppLocalizations.of(context)!.light):
                  Text(AppLocalizations.of(context)!.dark),
                  Spacer(),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showBottomSheetLanguage(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: false,
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35))
      ),
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  showBottomSheetTheme(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: false,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35))
      ),
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
