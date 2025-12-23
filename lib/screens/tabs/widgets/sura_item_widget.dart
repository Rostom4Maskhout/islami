import 'package:flutter/material.dart';
import 'package:islami/screens/models/quran_resources.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';


class SuraItemWidget extends StatelessWidget {
  final int index;
  const SuraItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Row(
      spacing: width *0.02,
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset(AppAssets.frame),
            Text('${index+1}',style: AppStyles.bold20White,),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${QuranResources.englishQuranSuras[index]}',style: AppStyles.bold20White,),
            Text('${QuranResources.ayaNumber[index]} verses',style: AppStyles.bold16White,),

          ],
        ),
        Spacer(),
        Text('${QuranResources.arabicQuranSuras[index]}',style: AppStyles.bold20White,),


      ],
    );
  }
}
