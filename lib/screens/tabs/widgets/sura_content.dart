import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/device_dimensions.dart';



class SuraContent extends StatelessWidget {
  final String content;
  final int index;
  const SuraContent({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.height*0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2
        ),

      ),
      child: Text( '$content ', style:AppStyles.bold20Gold, textAlign:TextAlign.center ,textDirection: TextDirection.rtl, ),
    );
  }
}
