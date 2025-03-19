import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../config/appImages.dart';

class WelcomeUserWidget extends StatefulWidget {
  const WelcomeUserWidget({super.key});

  @override
  State<WelcomeUserWidget> createState() => _WelcomeUserWidgetState();
}

class _WelcomeUserWidgetState extends State<WelcomeUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
            const SizedBox(width: 6),
             Icon(
                Icons.waving_hand,
                color: Colors.amber.shade700,
                size: AppConstants.screenWidth * 0.06,
              ),

          ],
        ),
        const SizedBox(height: 4),
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
    return Container(
      width: AppConstants.screenWidth * 0.12,
      height: AppConstants.screenWidth * 0.12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.white.withOpacity(0.9), Colors.grey.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 6,
            offset: const Offset(3, 3),
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 6,
            offset: Offset(-3, -3),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          Icons.menu,
          size: AppConstants.screenWidth * 0.07,
          color: Colors.black,
        ),
        onPressed: () {
          print("bee");
          Scaffold.of(context).openDrawer();

          // Add functionality if needed
        },
      ),
    );
  }
}
