import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import '../../../config/appConstants.dart';

class WelcomeUserWidget extends StatefulWidget {
  const WelcomeUserWidget({super.key});

  @override
  State<WelcomeUserWidget> createState() => _WelcomeUserWidgetState();
}

class _WelcomeUserWidgetState extends State<WelcomeUserWidget> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.screenWidth * 0.045,
        vertical: AppConstants.screenHeight * 0.013,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _buildWelcomeText()),
          _buildProfileIcon(),
        ],
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Welcome,",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: AppConstants.screenWidth * 0.045,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: AppConstants.screenWidth * 0.015),
            Icon(
              Icons.waving_hand,
              color: Colors.amber.shade700,
              size: AppConstants.screenWidth * 0.06,
            ),
          ],
        ),
        SizedBox(height: AppConstants.screenHeight * 0.005),
        Text(
          "Belal Ayman",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppConstants.screenWidth * 0.055,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileIcon() {
    double iconSize = AppConstants.screenWidth * 0.12;

    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.9),
            Colors.grey.shade200
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

      ),
      child: IconButton(
        icon: Icon(
          Icons.menu,
          size: iconSize * 0.58,
          color: Colors.black,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}
