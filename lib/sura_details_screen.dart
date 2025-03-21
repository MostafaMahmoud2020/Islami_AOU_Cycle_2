import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_aou_cycle2/my_theme_data.dart';
import 'package:islami_aou_cycle2/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List <String> verses=[];
  loadFile(int index) async{
    String file = await rootBundle.loadString("assets/files/${index+1}.txt");
    List <String> lines= file.split("\n");
    verses=lines;
    print(verses);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    SuraModel args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(verses.isEmpty){loadFile(args.index);}
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Islami", style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                elevation: 5,
                color: MyThemeData.whiteColor,
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "سورة ${args.suraName}",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,style:
                      Theme.of(context).textTheme.bodyMedium,
                    ),
                    Divider(color: MyThemeData.primaryColor,
                    thickness: 1,indent: 70,endIndent: 70,),
                    Expanded(
                      child: ListView.separated(itemBuilder: (context,index){

                        return Text("${verses[index]} (${index+1})",
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,);
                      },
                      separatorBuilder: (context,index)=>Divider(
                        color: MyThemeData.primaryColor,
                        thickness: 1,
                        endIndent: 70,
                        indent: 70,
                      ),
                        itemCount: verses.length,
                      ),
                    )


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
