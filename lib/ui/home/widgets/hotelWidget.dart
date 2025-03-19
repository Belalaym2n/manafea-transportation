import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/home/widgets/priceText.dart';
import 'package:manafea/ui/home/widgets/serviceName.dart';
import '../../core/shared_widget/elevatedButton.dart';
import 'imageNetwork.dart';

class HotelWidget extends StatelessWidget {
  const HotelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        serviceName(name: 'Recommended Hotels'),
        const SizedBox(height: 8),
        PhysicalModel(
    color: Colors.white,
    // لون الخلفية
    elevation: 10,
    // ارتفاع الظل
    shadowColor: Colors.black.withOpacity(0.3),
    // لون الظل وشفافيته
    borderRadius: BorderRadius.circular(12),
    // تدوير الحواف
    child:InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.hotels);
        },
        child: _buildHotelList()),)
      ],
    );
  }

  Widget _buildHotelList() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return PhysicalModel(
              color: Colors.white,
              // لون الخلفية
              elevation: 10,
              // ارتفاع الظل
              shadowColor: Colors.black.withOpacity(0.3),
          // لون الظل وشفافيته
          borderRadius: BorderRadius.circular(12),
          // تدوير الحواف
          child:_buildHotelCard());
        },
      ),
    );
  }

  Widget _buildHotelCard() {
    return PhysicalModel(
        color: Colors.white,
        // لون الخلفية
        elevation: 10,
        // ارتفاع الظل
        shadowColor: Colors.black.withOpacity(0.3),
    // لون الظل وشفافيته
    borderRadius: BorderRadius.circular(12),
    // تدوير الحواف
    child:Container(
      width: 280,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageNetwork(image: "assets/images/hotel (2).jpg"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hotelName(),
                const SizedBox(height: 4),
                hotelLocation(),
              ],
            ),
          ),
        ],
      ),
    ) );
  }
}

Widget hotelLocation() {
  return Row(
    children: [
      const Icon(Icons.location_on, color: Colors.red, size: 14),
      const SizedBox(width: 5),
      Expanded(
        child: Text(
          "109 Annonces De Locations apparence",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppConstants.screenWidth * 0.03,
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
      fontSize: 16,
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
