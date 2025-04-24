import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../config/base_class.dart';
import '../viewModel/bottomNavViewModel.dart';

class BottomNavAdmin extends StatefulWidget {
  const BottomNavAdmin({super.key});

  @override
  State<BottomNavAdmin> createState() => _BottomNavAdminState();
}

class _BottomNavAdminState extends BaseView<BottomNavViewModel,BottomNavAdmin> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<BottomNavViewModel>(
          builder:(context, value, child) => Scaffold(
            bottomNavigationBar: Container(

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Soft shadow for a sleek effect
                    blurRadius: 15,
                    offset: Offset(3, 3), // Slightly adjusted shadow direction
                  ),
                ],
                borderRadius: BorderRadius.circular(30), // More subtle rounded corners
                color: Colors.white, // Background color to maintain clarity
              ),
              child: GNav(
                style: GnavStyle.google,

                onTabChange: (value) {
                  viewModel.updateIndex(value);
                },
                haptic: true,
                tabBorderRadius: AppConstants.screenWidth * 0.03,
                backgroundColor: AppColors.primaryColor, // Keep the brand's primary color
                tabActiveBorder: Border.all(color: Colors.white, width: 2), // Border on active tab
                curve: Curves.easeInOut, // Smoother, more subtle transition effect
                duration: const Duration(milliseconds: 700), // Faster transition for responsiveness
                gap: 12, // Slightly more space between tabs for cleaner layout
                color: Colors.white, // Color for inactive tabs
                activeColor: Colors.black, // Dark color for active tabs to stand out
                iconSize: AppConstants.screenWidth * 0.065, // Adjust icon size for better visibility
                mainAxisAlignment: MainAxisAlignment.center,
                tabBackgroundColor: Colors.white, // Soft background for active tab
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.screenWidth * 0.05,
                  vertical: AppConstants.screenHeight * 0.000, // More padding for better balance
                ),
                tabs: [
                  GButton(
                    margin: EdgeInsets.symmetric(vertical:
                    AppConstants.screenHeight * 0.02),
                    icon: Icons.home_outlined, // Home icon
                    text: 'AddActivity',
                    iconColor: Colors.white, // Icon color to match the theme
                  ),
                  GButton(
                    margin: EdgeInsets.symmetric(vertical: AppConstants.screenHeight * 0.02),
                    icon: Icons.local_activity_outlined, // Notification icon
                    text: 'Travels',
                    iconColor: Colors.white, // Cool tone for notifications
                  ),
                  GButton(
                    margin: EdgeInsets.symmetric(vertical: AppConstants.screenHeight * 0.02),
                    icon: Icons.notifications, // Notification icon
                    text: 'Notification',
                    iconColor: Colors.white, // Cool tone for notifications
                  ),

                  GButton(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppConstants.screenWidth * 0.03,
                      vertical: AppConstants.screenHeight * 0.02,
                    ),
                    icon: Icons.shopping_cart_rounded, // Order icon
                    text: 'Order',
                    iconColor: Colors.white, // Green for order-related features
                  ),
                ],
              ),
            )
            ,
            body: viewModel.adminPages[viewModel.selectedIndex],
          )),
    );
  }

  @override
  BottomNavViewModel init_my_view_model() {
    // TODO: implement init_my_view_model
    return BottomNavViewModel();
  }

  @override
  onError(String message) {
    // TODO: implement onError
    throw UnimplementedError();
  }

  @override
  showLoading() {
    // TODO: implement showLoading
    throw UnimplementedError();
  }


}
