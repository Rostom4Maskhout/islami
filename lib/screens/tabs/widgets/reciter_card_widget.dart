
import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

import '../../../utils/app_assets.dart';



class ReciterCard extends StatelessWidget {
  final String name;
  const ReciterCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        image: DecorationImage(image: AssetImage(AppAssets.mosque,),),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            name,
            style: AppStyles.bold16Black
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_arrow, color: Colors.black),
              const SizedBox(width: 10),
              Icon(Icons.volume_up, color: Colors.black)
            ],
          ),

        ],
      ),
    );
  }
}