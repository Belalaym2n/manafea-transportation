import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/config/appImages.dart';
import 'package:manafea/ui/activity/widget/getActivitiesScreen/showDiestination.dart';
import 'package:manafea/ui/activity/widget/getActivitiesScreen/searchResultScreen.dart';

class ActivityScreenItem extends StatefulWidget {
  ActivityScreenItem({
    super.key,

    required this.isSearchPressed,
    required this.getActivities,
    required this.changeSearchBool,
    required this.selectedDestination,
    required this.changeDestination,
  });

  String? selectedDestination;
  Function(String) changeDestination;
  bool isSearchPressed;

  Function getActivities;
  Function changeSearchBool;

  @override
  State<ActivityScreenItem> createState() => _ActivityScreenItemState();
}

class _ActivityScreenItemState extends State<ActivityScreenItem> {
  final List<String> destinations = [
    "ff",
    "Riyadh - Nakheel",
    "Riyadh - Malaz",
    "Riyadh - Suwaidi"
  ];

  _buildQuestionText() {
    return Text(
      "Where do you want to move from?",
      style: TextStyle(
          fontSize: AppConstants.screenWidth * 0.045,
          fontWeight: FontWeight.bold), // حجم الخط بناءً على العرض
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: Colors.white,

      body: Padding(
        padding: EdgeInsets.all(AppConstants.screenWidth * 0.04),
        // 4% من العرض
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuestionText(),
            SizedBox(height: AppConstants.screenHeight * 0.02),
            // 2% من الارتفاع
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => showLocationsPicker(
                        context: context,
                        changeDestination: widget.changeDestination,
                        location: widget.selectedDestination,
                        locations: destinations),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppConstants.screenHeight * 0.015,
                          // 1.5% من الارتفاع
                          horizontal: AppConstants.screenWidth * 0.04),
                      // 4% من العرض
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.selectedDestination ?? "Select a location",
                            style: TextStyle(
                                fontSize: AppConstants.screenWidth * 0.04,
                                // 4% من العرض
                                color: Colors.black54),
                          ),
                          Icon(Icons.arrow_drop_down_circle)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppConstants.screenWidth * 0.04),
                _buildElevatedButton(),
              ],
            ),
            SizedBox(height: AppConstants.screenHeight * 0.03),

            widget.isSearchPressed == false?
              Expanded(
                 child: Center(
                  child: _buildDefaultImage(), // Show image by default
                ),
              ) : widget.getActivities(),


          ],
        ),
      ),
    );
  }

  _buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
       widget.changeSearchBool();
       },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: EdgeInsets.symmetric(
            horizontal: AppConstants.screenWidth * 0.1, // 10% من العرض
            vertical: AppConstants.screenHeight * 0.02), // 2% من الارتفاع
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text("Search",
          style: TextStyle(
              color: Colors.white,
              fontSize: AppConstants.screenWidth * 0.04)), // 4% من العرض
    );
  }

  Widget _buildDefaultImage() {
    return Image.asset(
      AppImages.search, // Replace with your image path
      width: AppConstants.screenWidth,
      height: AppConstants.screenHeight * 0.45, // 45% من الارتفاع
      fit: BoxFit.fill,
    );
  }
}
