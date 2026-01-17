import 'package:flutter/material.dart';
import 'package:islami/screens/models/quran_resources.dart';
import 'package:islami/screens/tabs/widgets/most_recent_widget.dart';
import 'package:islami/screens/tabs/widgets/sura_item_widget.dart';
import 'package:islami/shared_prefs_utils.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_styles.dart';

class QuranTab extends StatefulWidget {
   QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.046),
      child: Column(
        spacing: height*0.01,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          TextField(

            cursorColor: AppColors.primaryColor,
            onChanged: (newText) => {
               searchByNewText(newText)
            },
            style: AppStyles.bold16White ,
            decoration: InputDecoration(
              enabledBorder: builtBorder(),

              focusedBorder: builtBorder(),
              prefixIcon: Image.asset(AppAssets.searchIcon,height: 5,),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White


            ),
          ),
          MostRecentWidget(),
          Text('Suras list',style: AppStyles.bold16White,),
          Expanded(child: filterList.isEmpty ?
              Center(child:Text('No sura is found',style: AppStyles.bold20White,) ,)
          :
          ListView.separated(
              itemBuilder: (context,index){
                return InkWell(
                    onTap: (){
                      saveLastSuraIndex(filterList[index]);
                      Navigator.of(context).pushNamed(AppRoutes.suraDetailsRoute,arguments: filterList[index]);
                    },
                    child: SuraItemWidget(index: filterList[index],));
              },
              separatorBuilder: (context,index){
                return Divider(
                  color: Colors.white,
                  thickness: 2,
                  endIndent: width*0.06 ,
                  indent: width *0.06,
                );
              },
              itemCount: filterList.length))
        ],
      ),
    );
  }

  OutlineInputBorder builtBorder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2
        )
    );
  }

  void searchByNewText(String newText) {
    List<int>  suraSearchList = [];
    for(int i =0;i < QuranResources.arabicQuranSuras.length;i++){
      if (QuranResources.englishQuranSuras[i].toLowerCase().contains(newText.toLowerCase())){
        suraSearchList.add(i);
      }
    }
    for(int i =0;i < QuranResources.arabicQuranSuras.length;i++){

      if (QuranResources.arabicQuranSuras[i].contains(newText)){
        suraSearchList.add(i);
      }
    }
    filterList = suraSearchList;
    setState(() {

    });
  }
}
