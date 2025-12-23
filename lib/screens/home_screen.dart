import 'package:flutter/material.dart';
import 'package:islami/screens/tabs/hadith_tab.dart';
import 'package:islami/screens/tabs/quran_tab.dart';
import 'package:islami/screens/tabs/radio_tab.dart';
import 'package:islami/screens/tabs/sebha_tab.dart';
import 'package:islami/screens/tabs/time_tab.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> bgImages= [
    AppAssets.quranBg,
    AppAssets.hadithBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,

  ];
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()

  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Image.asset(bgImages[selectedIndex],width: double.infinity,height: double.infinity,

        fit: BoxFit.fill,),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index){
              selectedIndex = index;
              setState(() {

              });

            },
            type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
             backgroundColor: AppColors.primaryColor,

              items: [
            buildNavigation(iconName: AppAssets.quranIcon, label: 'Quran',index: 0),
            buildNavigation(iconName: AppAssets.hadithIcon, label: 'Hadith',index: 1),
            buildNavigation(iconName: AppAssets.sebhaIcon, label: 'Sebha',index: 2),
            buildNavigation(iconName: AppAssets.radioIcon, label: 'Radio',index: 3),
            buildNavigation(iconName: AppAssets.timeIcon, label: 'Time',index:4)


          ]),
          
          body: Column(
            spacing: 15,
            children: [
              Image.asset(AppAssets.logo,height: height*0.16,),
              Expanded(child: tabs[selectedIndex])
              


            ],
          ),


        ),
      ],


    );
  }

  BottomNavigationBarItem buildNavigation({
    required String iconName , required String label
    , required int index
}){

    return BottomNavigationBarItem(
        icon: selectedIndex == index ?  Container(
          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
             color: AppColors.backbgColor
          ),
            child: ImageIcon(AssetImage(iconName))) :

            ImageIcon(AssetImage(iconName))

        ,label: label );
  }
}
