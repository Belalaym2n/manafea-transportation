import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/appColors.dart';
import '../../../config/appImages.dart';

class CasualImage extends StatefulWidget {
  const CasualImage({super.key});

  @override
  State<CasualImage> createState() => _CasualImageState();
}
class _CasualImageState extends State<CasualImage> {
  int _currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(AppConstants.screenWidth * 0.05)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                showImages(),
                Column(
                  children: [
                    SizedBox(height: AppConstants.screenHeight * 0.113),
                    Center(child: smoothIndicator()),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  smoothIndicator() {
    return SmoothPageIndicator(
      controller: PageController(initialPage: _currentIndex),
      count: imageUrls.length,
      effect: const ExpandingDotsEffect(
        spacing: 6.0,
        radius: 10.0,
        dotWidth: 8.0,
        dotHeight: 8.0,
        expansionFactor: 1.2,
        dotColor: Colors.white,
        activeDotColor: AppColors.primaryColor,
      ),
      onDotClicked: (newIndex) {
        setState(() {
          pageController.animateToPage(_currentIndex,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        });
      },
    );
  }

  showImages() => Material(
    borderRadius: BorderRadius.circular(23),
    child: CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayCurve: Curves.linear,
        aspectRatio: 16 / 9,
        onPageChanged: (index, reason) {
          _currentIndex = index;
          setState(() {});
        },
        initialPage: 0,
        enableInfiniteScroll: true,
        viewportFraction: 0.93,
        reverse: false,
        enlargeCenterPage: true,
        enlargeFactor: 0.5,
        scrollDirection: Axis.horizontal,
      ),
      items: imageUrls.map((imageUrl) {
        return Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.04),
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                height: 100,
                width: MediaQuery.of(context).size.width,
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ]);
      }).toList(),
    ),
  );

  final imageUrls = [
    AppImages.carsualImage2,
    AppImages.carsualImage1,
    AppImages.carsualImage2,
  ];
}
