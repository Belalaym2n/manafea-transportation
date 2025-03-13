import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../config/appImages.dart';

class WelcomeUserWidget extends StatelessWidget {
  const WelcomeUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute elements evenly
        children: [
          Expanded(
            child: _buildWelcomeText(),
          ),
          _buildProfileIcon(),
        ],
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Improved text alignment
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [  Text(
          "Welcome",
          style: TextStyle(
            color: Colors.grey.shade600, // Subtle and friendly color
            fontSize: AppConstants.screenWidth * 0.04, // Slightly larger font size
            fontWeight: FontWeight.w500, // Medium weight for clarity
          ),
        ),
        SizedBox(width: AppConstants.screenWidth * 0.01), // Add spacing between text and icon

        Icon(
          Icons.waving_hand_sharp, // Handshake icon for a greeting or hello gesture
          color: Colors.amber, // Matching the icon color with the name
          size: AppConstants.screenWidth * 0.056, // Balanced icon size for visibility
          weight: 60,
          applyTextScaling: true,
          // Adjusted icon size for balance
        ), ],
        ),

            Text(
              "Belal Ayman",
              style: TextStyle(
                color: AppColors.primaryColor, // Use primary color for name
                fontSize: AppConstants.screenWidth * 0.05, // Larger font size for the name
                fontWeight: FontWeight.bold, // Bold to emphasize the name
              ),
            ),


      ],
    );
  }

  Widget _buildProfileIcon() {
    return Container(
      width: AppConstants.screenWidth * 0.12,
      height: AppConstants.screenWidth * 0.12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.9),
            Colors.grey.shade200,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 6,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 6,
            offset: Offset(-3, -3),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.person_rounded,
          size: AppConstants.screenWidth * 0.08,
          color: Colors.grey.shade700,
        ),
      ),
    );

  }
}
