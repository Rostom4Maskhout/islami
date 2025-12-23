import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islami/screens/tabs/widgets/hadith_item.dart';
import 'package:islami/utils/device_dimensions.dart';




class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: context.height*0.66,
      aspectRatio: 313/618,
      enlargeCenterPage: true),
      items: List.generate(50, (index)=>index +1).map((index) {
        return HadithItem(index: index,);
      }).toList(),
    );
  }
}
