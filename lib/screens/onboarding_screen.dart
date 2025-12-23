import 'package:flutter/material.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/utils/app_routes.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Image.asset(AppAssets.logo,height: 120,),
          Expanded(
            child: IntroductionScreen(
              globalBackgroundColor: AppColors.backgroundColor,


              pages: [
                _page(
                  image: 'assets/images/boarding1.png',
                  title: 'Welcome To Islami App',
                  body: '',
                ),
                _page(
                  image: 'assets/images/boarding2.png',
                  title: 'Welcome To Islami',
                  body: 'We Are Very Excited To Have You In Our Community',
                ),
                _page(
                  image: 'assets/images/boarding3.png',
                  title: 'Reading the Quran',
                  body:
                  'Read, and your Lord is the Most Generous',
                ),
                _page(
                  image: 'assets/images/boarding4.png',
                  title: 'Bearish',
                  body: 'Praise the name of your Lord, the Most High',
                ),
                _page(
                  image: 'assets/images/boarding5.png',
                  title: 'Holy Quran Radio',
                  body:
                  'You can listen to the Holy Quran Radio through the application for free and easily',
                ),

              ],
              showBackButton: true,
              back: _navText('Back'),
              next: _navText('Next'),
              done: _navText('Finish'),

              onDone: () {
                Navigator.pushReplacementNamed(context,AppRoutes.homeRoute);
              },

              dotsDecorator: const DotsDecorator(
                size: Size(5, 5),
                color: Colors.grey,
                activeSize: Size(22, 8),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                activeColor: AppColors.goldColor ,
              ),

              controlsPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),


            ),
          ),
        ],
      ),


    );
  }
  PageViewModel _page({
    required String image,
    required String title,
    required String body,
  }) {
    return PageViewModel(
      titleWidget: const SizedBox.shrink(),

      bodyWidget: Column(
        children: [

          Image.asset(
            image,
            height: 200,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 20),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.goldColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.goldColor,
                fontSize: 15,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.goldColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }


}
