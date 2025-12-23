import 'package:flutter/material.dart';
import 'package:islami/screens/tabs/widgets/sura_item_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
            style: AppStyles.bold16White ,
            decoration: InputDecoration(
              enabledBorder: builtBorder(),
              focusedBorder: builtBorder(),
              prefixIcon: Image.asset(AppAssets.searchIcon,height: 5,),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White


            ),
          ),
          Text('Most recently',style: AppStyles.bold16White,),
          SizedBox(
            height: height*0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: width*0.02),
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
                            Text('Al-Anbiya',style: AppStyles.bold24Black,),
                            Text('الأنبياء',style: AppStyles.bold24Black),
                            Text('112 Verses',style: AppStyles.bold14Black),
                          ],
                        ),
                        Image.asset(AppAssets.mostRecent)
                      ],
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(
                    width: width*0.02,
                  );
                },
                itemCount: 10),
          ),
          Text('Suras list',style: AppStyles.bold16White,),
          Expanded(child: ListView.separated(
              itemBuilder: (context,index){
                return InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(AppRoutes.suraDetailsRoute,arguments: index);
                    },
                    child: SuraItemWidget(index: index,));
              },
              separatorBuilder: (context,index){
                return Divider(
                  color: Colors.white,
                  thickness: 2,
                  endIndent: width*0.06 ,
                  indent: width *0.06,
                );
              },
              itemCount: 114))
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
}
