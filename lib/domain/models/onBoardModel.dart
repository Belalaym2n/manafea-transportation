
import '../../config/appImages.dart';

class OnBoardModel {
  String imageUrl;
  String headline;
  String description;

  OnBoardModel(
      {required this.imageUrl,
        required this.headline,
        required this.description});

  static List<OnBoardModel> items = [
    OnBoardModel(
        imageUrl: AppImages.onBoardImageOne,
        headline: 'CAR BOOKING',
        description:
            'Experience a seamless and efficient car booking process,\n'
            'designed to meet your travel needs. Choose from a wide range\n'
            ' of vehicles, from compact cars for city commutes to  luxury\n'
            ' cars for special occasions,all available at your fingertips\n'
            '. Our user-friendly platform    ensures  fast  and  secure, \n'
            'reservations with  flexible pick-up and drop-off  locations\n'
            ' to suit your schedule. Enjoy a hassle-free journey,with\n'
            ' confidence that your car will be ready when you are'
    ),
    OnBoardModel(
        imageUrl: AppImages.onBoardImageTwo,
        headline: 'NOTIFICATION OFFER',
        description:
            'Stay updated with exclusive travel deals,limited-time\n'
            'discounts, and personalized offers on hotels,car rentals\n'
            'and vacation packages. Whether you’re planning a  luxury\n'
            'getaway, a business trip, or a last-minute escape,   our\n'
            'curated promotions ensure the best value.Receive instant\n'
            'notifications on special rates,flash sales,and exclusive\n'
            'bundles,helping you save more while experiencing seamles\n'
            'booking convenience. Unlock a world of travel benefits,\n'
            'ensuring every journey is affordable, comfortable, and\n'
            ' perfectly tailored to your needs'),

    OnBoardModel(
        imageUrl: AppImages.onBoardImageThree,
        headline: 'HOTEL BOOKING',
        description:
            'Simplify your travel experience with seamless hotel \n'
            'bookings.Choose from a wide  selection of accommodations,\n'
            'ranging from budget-friendly options to luxurious resorts\n'
            'all carefully curated to meet your preferences.Our easy to\n'
            'use platform allows you  to make secure reservations with\n'
            'flexible  check-in  and  check-out times. Enjoy  instant\n'
            'confirmation, ensuring that your stay is smooth and\n'
            'stress-free, no matter your destination or purpose \n'
            'of travel.'
    )
  ];
}
