import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/home/widgets/priceText.dart';
import 'package:manafea/ui/home/widgets/serviceName.dart';
import '../../core/shared_widget/elevatedButton.dart';
import 'imageNetwork.dart';

class HotelWidget extends StatefulWidget {
  const HotelWidget({super.key});

  @override
  State<HotelWidget> createState() => _HotelWidgetState();
}

class _HotelWidgetState extends State<HotelWidget> {
  @override
  Widget build(BuildContext context) {
    // تحديد أبعاد الشاشة
    AppConstants.initSize(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        serviceName(name: '#RecommendedHotels'),
        SizedBox(height: AppConstants.screenHeight * 0.01), // 2% من الارتفاع
        PhysicalModel(
          color: Colors.white,
          elevation: 10,
          shadowColor: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
          child: _buildHotelList(),
        )
      ],
    );
  }

  Widget _buildHotelList() {
    return SizedBox(
      height: AppConstants.screenHeight * 0.296, // 30% من الارتفاع
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal:
        AppConstants.screenWidth * 0.04), // 4% من العرض
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (_, __) => SizedBox(
            width: AppConstants.screenWidth * 0.04), // 4% من العرض
        itemBuilder: (context, index) {
          return PhysicalModel(
              color: Colors.white,
              elevation: 10,
              shadowColor: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
              child: _buildHotelCard());
        },
      ),
    );
  }

  Widget _buildHotelCard() {
    return PhysicalModel(
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: AppConstants.screenWidth * 0.7, // 70% من العرض
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageNetwork(
                    image: "assets/images/hotel (2).jpg"),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.screenWidth
                          * 0.03, vertical: 4), // 3% من العرض
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hotelName(),
                      SizedBox(height: AppConstants.screenHeight * 0.01), // 1% من الارتفاع
                      hotelLocation(),
                    ],
                  ),
                ),
                SizedBox(height: AppConstants.screenHeight * 0.01), // 2% من الارتفاع

                // 1% من الارتفاع
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                        AppConstants.screenWidth * 0.02), // 3% من العرض
                      child: smallElevatedButton(
                          buttonName: "Book Now", onTap: (){
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.pushNamed(context, AppRoutes.hotels);
                        });                       }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

Widget hotelLocation() {
  return Row(
    children: [
      const Icon(Icons.location_on, color: Colors.red, size: 14),
      SizedBox(width: AppConstants.screenWidth * 0.02), // 2% من العرض
      Expanded(
        child: Text(
          "109 Annonces De Locations apparence",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppConstants.screenWidth * 0.03, // حجم الخط بناءً على العرض
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

Widget hotelName() {
  return Text(
    "Luxury Hotel",
    style: TextStyle(
      color: AppColors.primaryColor,
      fontSize: AppConstants.screenWidth * 0.04, // حجم الخط بناءً على العرض
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(1, 1),
        ),
      ],
    ),
  );
}
