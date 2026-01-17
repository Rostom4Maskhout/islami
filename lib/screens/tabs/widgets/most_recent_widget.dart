import 'package:flutter/material.dart';
import 'package:islami/provider/most_recent_provider.dart';
import 'package:islami/screens/models/quran_resources.dart';
import 'package:islami/shared_prefs_utils.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/device_dimensions.dart';



class MostRecentWidget extends StatefulWidget {
   MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();

}

class _MostRecentWidgetState extends State<MostRecentWidget> {

  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    mostRecentProvider.getLastSuraList();

    },);
  }



  @override
  Widget build(BuildContext context) {
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return  Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most recently',style: AppStyles.bold16White,),
          SizedBox(
            height: context.height*0.16,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: context.width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primaryColor
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text( QuranResources.englishQuranSuras[mostRecentProvider.mostRecentList[index]],style: AppStyles.bold24Black,),
                            Text(QuranResources.arabicQuranSuras[mostRecentProvider.mostRecentList[index]],style: AppStyles.bold24Black),
                            Text('${QuranResources.englishQuranSuras[mostRecentProvider.mostRecentList[index]]} verses',style: AppStyles.bold14Black),
                          ],
                        ),
                        Image.asset(AppAssets.mostRecent)
                      ],
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(
                    width: context.width*0.02,
                  );
                },
                itemCount:mostRecentProvider.mostRecentList.length),
          ),
        ],
      ),
    );
  }
}
