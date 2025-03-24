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

  final List<String> imageUrls = [
    AppImages.carsualImage2,
    AppImages.carsualImage1,
    AppImages.carsualImage2,
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.screenWidth * 0.05),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _buildImages(),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: smoothIndicator(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget smoothIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: _currentIndex,
      count: imageUrls.length,
      effect: ExpandingDotsEffect(
        spacing: 6.0,
        radius: 8.0,
        dotWidth: 8.0,
        dotHeight: 8.0,
        expansionFactor: 1.5,
        dotColor: Colors.grey.shade400,
        activeDotColor: AppColors.primaryColor,
      ),
      onDotClicked: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget _buildImages() {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      options: CarouselOptions(
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
          borderRadius: BorderRadius.
          circular(AppConstants.screenWidth * 0.04),
          child: Image.asset(
            imageUrls[index],
            width: double.infinity,
            height: 200,
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
