import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../config/appImages.dart';

class CasualImage extends StatefulWidget {
  const CasualImage({super.key});

  @override
  State<CasualImage> createState() => _CasualImageState();
}

class _CasualImageState extends State<CasualImage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

    List<String> imageUrls = [
    AppImages.carsualImage2,
    AppImages.carsualImage1,
   ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
          AppConstants.screenWidth * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _buildImages(),
                // Padding(
                //   padding: EdgeInsets.only(
                //     bottom: AppConstants.screenHeight * 0.015,
                //   ),
                //   child: smoothIndicator(),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  //
  // Widget smoothIndicator() {
  //   return AnimatedSmoothIndicator(
  //     activeIndex: _currentIndex,
  //     count: imageUrls.length,
  //     effect: ExpandingDotsEffect(
  //       spacing: AppConstants.screenWidth * 0.016,
  //       radius: AppConstants.screenWidth * 0.02,
  //       dotWidth: AppConstants.screenWidth * 0.022,
  //       dotHeight: AppConstants.screenWidth * 0.022,
  //       expansionFactor: 1.5,
  //       dotColor: Colors.w,
  //       activeDotColor: AppColors.primaryColor,
  //     ),
  //     onDotClicked: (index) {
  //       setState(() {
  //         _currentIndex = index;
  //       });
  //     },
  //   );
  // }

  Widget _buildImages() {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      options: CarouselOptions(
        height: AppConstants.screenHeight*0.25,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayCurve: Curves.easeInOut,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        viewportFraction: 0.9,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      itemBuilder: (context, index, realIndex) {
        return ClipRRect(
          borderRadius:
          BorderRadius.circular(AppConstants.screenWidth * 0.04),
          child: Image.asset(
            imageUrls[index],
            width: double.infinity,
            height: AppConstants.screenHeight * 0.25, // بدل 200 ثابت
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
