import 'package:flutter/material.dart';
import 'package:islami_aou_cycle2/AhadethModel.dart';
import 'package:islami_aou_cycle2/my_theme_data.dart';

class AhadethScreen extends StatelessWidget {
  static const String routeName = "AhadethScreen";

  @override
  Widget build(BuildContext context) {
    AhadethModel args =ModalRoute.of(context)?.settings.arguments as AhadethModel;
    return SafeArea(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill,
            )),
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Islami",
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
              body: Padding(
                padding: EdgeInsets.all(18),
                child: Card(
                  elevation: 7,
                  color: MyThemeData.whiteColor,
                  child: Column(
                    children: [
                  SizedBox(height: 2,),
                      Text("${args.title}",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold
                      ),),
                      Divider(color: MyThemeData.primaryColor,
                      thickness: 1,
                      endIndent: 80,
                      indent: 80,),
                      Expanded(
                        child: ListView.separated(itemBuilder: (context,index){
                        
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: Text("${args.content[index]}",textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),),
                          );
                        },
                            separatorBuilder: (context,index){return
                            Divider(
                              indent: 50,
                              endIndent: 50,
                              thickness: 2,
                        
                            );},
                            itemCount: args.content.length),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
