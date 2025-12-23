import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/screens/models/hadith.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/device_dimensions.dart';



class HadithItem extends StatefulWidget {
  final int index ;

  HadithItem({super.key,required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  Hadith? hadith;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width*0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(AppAssets.hadithImage)),
        color: AppColors.primaryColor

      ),
      child: hadith == null ?
          Center(child: CircularProgressIndicator(color: AppColors.backbgColor,),):
      Column(
        spacing: context.height* 0.02,

        children: [
          Row(
            children: [
              Image.asset(AppAssets.leftHadith,width: context.width * 0.16,),
              Expanded(child: Text(hadith?.title ?? '',style: AppStyles.bold24Black,textAlign: TextAlign.center, )),
              Image.asset(AppAssets.rightHadith,width: context.width * 0.16,),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(child:
            Text(hadith?.content ?? '',style: AppStyles.bold16Black,textAlign: TextAlign.center,),),
          ),
          Image.asset(AppAssets.mosque,width: double.infinity,)

        ],
      ),
    );
  }

  void loadHadithFile (int index)async{
    String fileContent = await rootBundle.loadString('assets/files/Hadith/h$index.txt');
    String title = fileContent.substring(0 ,fileContent.indexOf('\n'));
    String content = fileContent.substring(fileContent.indexOf('\n')+1);
    hadith = Hadith(title: title, content: content);

    setState(() {

    });

  }
}
