import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/config/appImages.dart';
import 'package:manafea/ui/home/widgets/priceText.dart';

class FavItem extends StatelessWidget {
  const FavItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppConstants.screenHeight*0.01,
          horizontal:
          AppConstants.screenWidth * 0.04),
      child: Container(
        height: AppConstants.screenHeight*0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: AppConstants.screenWidth * 0.04),
            _buildImage(),
            SizedBox(width: AppConstants.screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Candi Borobuder",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppConstants.screenWidth * 0.045,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  SizedBox(height: 6),
                  _buildLocation(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocation() {
    return Row(
      children: [
        Icon(Icons.location_on, color: Colors.redAccent, size: 16),
        SizedBox(width: 5),
        Text(
          "New York, U.S.",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: AppConstants.screenWidth * 0.035,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        AppImages.travel,
        height: AppConstants.screenHeight * 0.12,
        width: AppConstants.screenWidth * 0.28,
        fit: BoxFit.cover,
      ),
    );
  }
}