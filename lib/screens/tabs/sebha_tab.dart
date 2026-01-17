import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/device_dimensions.dart';


class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int zikrIndex = 0;
  double rotationAngle = 0.0;

  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  void onTasbeehTap() {
    setState(() {
      counter++;
      rotationAngle += 30.0;
      if (counter == 33) {
        counter = 0;
        zikrIndex = (zikrIndex + 1) % azkar.length;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [


          Center(
            child: Column(

              children: [

                Text(
                  "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
                  style: AppStyles.bold28White,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: context.height *0.05),
                GestureDetector(
                  onTap: onTasbeehTap,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            AppAssets.sebhaHead,
                            width: 50,
                            height: 50,
                          ),
                          AnimatedRotation(
                            turns: rotationAngle / 360,
                            duration:  Duration(milliseconds: 300),
                            child: Image.asset(
                              AppAssets.sebhaBody,
                              width: 300,
                              height: 300,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            azkar[zikrIndex],
                            style: AppStyles.bold36White
                          ),
                          SizedBox(height: 10),
                          Text(
                            "$counter",
                            style: AppStyles.bold28White
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
