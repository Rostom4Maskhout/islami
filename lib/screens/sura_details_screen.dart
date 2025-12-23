import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/screens/models/quran_resources.dart';
import 'package:islami/screens/tabs/widgets/sura_content.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/device_dimensions.dart';


class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses =[];
  String  suraContent ='';
  bool isContainer = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var args = ModalRoute.of(context)?.settings.arguments as int ;
    if (verses.isEmpty){
      loadSuraFile(args);


    }
    return Scaffold(
      appBar: AppBar(
        title: Text(QuranResources.englishQuranSuras[args],style: AppStyles.bold20Gold,),
        actions: [InkWell(child: Icon(Icons.text_snippet),onTap: (){
          isContainer = false;
          setState(() {
            
          });
        },),
          InkWell(child: Icon(Icons.textsms),onTap: (){
            isContainer = true;
            setState(() {

            });
          },)
        ],
        actionsPadding: EdgeInsets.symmetric(horizontal: height*0.03),

      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width * 0.04 ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.left),
                Text(QuranResources.arabicQuranSuras[args],style: AppStyles.bold20Gold,),
                Image.asset(AppAssets.right)


              ],
            ),
            Expanded(child:verses.isEmpty?
            Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)):
                
                isContainer?
            ListView.separated(
              padding: EdgeInsets.only(top:context.height *0.02 ),
                itemBuilder: (context,index){
                  return SuraContent(content: verses[index], index: index,);
                },
                separatorBuilder: (context, index){
                  return SizedBox(height: context.height *0.02,);
                },
                itemCount: verses.length): SingleChildScrollView(
                  child: Text(suraContent,style:AppStyles.bold20Gold,textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,),
                ) )
            ,
            Image.asset(AppAssets.decoration)
          ],
        ),
      ),
    );
  }

  void loadSuraFile (int index)async{
     String fileContent = await rootBundle.loadString('assets/files/Suras/${index +1}.txt');
     List <String> lines = fileContent.split('\n');
     verses = lines;
     for(int i =0; i < lines.length ; i++){
       lines[i] += '[${i +1}]';
     }
     suraContent = lines.join();
     await Future.delayed(Duration(seconds: 1));
     setState(() {

     });
  }
}
