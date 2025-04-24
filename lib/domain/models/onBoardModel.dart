
import '../../config/appImages.dart';

class OnBoardModel {
  String imageUrl;
  String headline;
  String description;


  OnBoardModel(
      {required this.imageUrl,
        required this.headline,
        required this.description,
    });

  static List<OnBoardModel> items = [
    OnBoardModel(
        imageUrl: AppImages.onBoardImageOne,
        headline: 'Please choose your language\nFor better For better ',
        description: 'Seamless and efficient booking process  Wide range of vehicle choices'
    ),
    OnBoardModel(
        imageUrl: AppImages.onBoardImageOne,
        headline: 'Seamless, efficient process\nWide vehicle selection available',
description: 'Seamless and efficient booking process  Wide range of vehicle choices'
    ),

    OnBoardModel(
        imageUrl: AppImages.onBoardImageTwo,
        headline: 'Exclusive Travel Deals \nDiscounts, personalized offers'
        ,description: 'Stay updated with special discounts\nPersonalized offers on travel bookings'
    ),

    OnBoardModel(
        imageUrl: AppImages.onBoardImageThree,
        headline: 'Seamless Hotel Booking \nSecure, flexible reservations',
description: ' Simplify travel with easy bookings\n Secure stays with flexible options'
    ),

  ];
}
