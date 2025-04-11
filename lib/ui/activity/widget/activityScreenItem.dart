import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/config/appImages.dart';
import 'package:manafea/ui/activity/widget/searchResultScreen.dart';

class ActivityScreenItem extends StatefulWidget {
  const ActivityScreenItem({super.key});

  @override
  State<ActivityScreenItem> createState() => _ActivityScreenItemState();
}

class _ActivityScreenItemState extends State<ActivityScreenItem> {
  String? selectedLocation;
  final List<String> locations = [
    "Riyadh - Olaya",
    "Riyadh - Nakheel",
    "Riyadh - Malaz",
    "Riyadh - Suwaidi"
  ];
  bool isSearchPressed = false;

  _buildQuestionText(){
    return  Text(
      "Where do you want to move from?",
      style: TextStyle(fontSize: AppConstants.screenWidth * 0.045, fontWeight: FontWeight.bold), // حجم الخط بناءً على العرض
    );
  }

  @override
  Widget build(BuildContext context) {
    // تحديد أبعاد الشاشة
    AppConstants.initSize(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(AppConstants.screenWidth * 0.04), // 4% من العرض
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildQuestionText(),
              SizedBox(height: AppConstants.screenHeight * 0.02), // 2% من الارتفاع
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _showLocationPicker(),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: AppConstants.screenHeight * 0.015, // 1.5% من الارتفاع
                            horizontal: AppConstants.screenWidth * 0.04), // 4% من العرض
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedLocation ?? "Select a location",
                              style: TextStyle(
                                  fontSize: AppConstants.screenWidth * 0.04, // 4% من العرض
                                  color: Colors.black54),
                            ),
                            Icon(Icons.arrow_drop_down_circle)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppConstants.screenWidth * 0.04), // 4% من العرض
                  _buildElevatedButton() ,
                ],
              ),
              SizedBox(height: AppConstants.screenHeight * 0.03), // 3% من الارتفاع

              // Display Image or Widget based on search button state
              Expanded(
                child: Center(
                  child: isSearchPressed
                      ? SearchResultScreen() // Show widget after search
                      : _buildDefaultImage(), // Show image by default
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildElevatedButton(){
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isSearchPressed = true;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: EdgeInsets.symmetric(
            horizontal: AppConstants.screenWidth * 0.1, // 10% من العرض
            vertical: AppConstants.screenHeight * 0.02), // 2% من الارتفاع
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
      ),
      child: Text("Search",
          style: TextStyle(
              color: Colors.white,
              fontSize: AppConstants.screenWidth * 0.04)), // 4% من العرض
    );
  }

  void _showLocationPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppConstants.screenHeight * 0.02, // 2% من الارتفاع
                  horizontal: AppConstants.screenWidth * 0.04), // 4% من العرض
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Select a Location",
                    style: TextStyle(
                      fontSize: AppConstants.screenWidth * 0.06, // 6% من العرض
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: AppConstants.screenHeight * 0.02), // 2% من الارتفاع
                  Divider(thickness: 1.2, color: Colors.grey[300]),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedLocation == locations[index];

                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(vertical: AppConstants.screenHeight * 0.01), // 1% من الارتفاع
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: Icon(
                              Icons.location_on,
                              color: isSelected ? Colors.white : Colors.red),
                          title: Text(
                            locations[index],
                            style: TextStyle(
                              fontSize: AppConstants.screenWidth * 0.04, // 4% من العرض
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.white : AppColors.primaryColor,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedLocation = locations[index];
                            });

                            setModalState(() {});
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.pop(context);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
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
