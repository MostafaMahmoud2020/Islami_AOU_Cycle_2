import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_aou_cycle2/ahadeth_screen.dart';
import 'package:islami_aou_cycle2/my_theme_data.dart';
import 'package:islami_aou_cycle2/AhadethModel.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List <AhadethModel> allAhadeth = [];
  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadFile();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/ahadeth_image.png"),
        Divider(
          thickness: 3,
          color: MyThemeData.primaryColor,
        ),
        Text(
          "الاحاديث",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        Divider(
          thickness: 3,
          color: MyThemeData.primaryColor,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context,index){
                return InkWell(
                  onTap: () {

                    Navigator.pushNamed(context, AhadethScreen.routeName,
                    arguments:allAhadeth[index]

                    );
                  },
                  child: Text("${allAhadeth[index].title}",style:
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold
                    ),textAlign: TextAlign.center
                    ,),
                );
              },
              separatorBuilder:(context,index){
                return Divider(color: MyThemeData.primaryColor,
                endIndent: 70,indent: 70,
                );
              } ,
              itemCount: allAhadeth.length),
        )
      ],
    );
  }

  loadFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        List<String> hadethLine = ahadethList[i].trim().split("\n");
        String title = hadethLine[0];
        hadethLine.removeAt(0);
        List <String> content =hadethLine;
        allAhadeth.add(AhadethModel(title: title,content:content));
      }

      setState(() {});
    });
  }
}
