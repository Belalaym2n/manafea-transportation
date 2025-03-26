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
  bool isSearchPressed = false; // Track if the search button is clicked

  _buildQuestionText(){
    return  Text(
      "Where do you want to move from?",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               _buildQuestionText(),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _showLocationPicker(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
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
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                            Icon(Icons.arrow_drop_down_circle)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  _buildElevatedButton() ,
                ],
              ),
              const SizedBox(height: 20),

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
        padding: const EdgeInsets.symmetric(
            horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text("Search",

          style: TextStyle(
              color: Colors.white,
              fontSize: 16)),
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
        return StatefulBuilder( // لجعل الـ setState يعمل داخل الـ bottomSheet
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // العنوان
                  Text(
                    "Select a Location",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(thickness: 1.2, color: Colors.grey[300]),

                  // قائمة الأماكن مع تغيير لون الخلفية عند الاختيار
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedLocation == locations[index];

                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: isSelected ?
                AppColors.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading:  Icon(
                              Icons.location_on, color: isSelected ?
                        Colors.white:Colors.red),
                          title: Text(
                            locations[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.white
                                  : AppColors.primaryColor,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedLocation = locations[index];
                            });

                            setModalState(() {}); // تحديث لون العنصر المختار

                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.pop(context); // إغلاق النافذة بعد ثانية
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
      height: AppConstants.screenHeight*0.45,
      fit: BoxFit.fill,
    );
  }

  Widget _searchResultsWidget() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        "Search results appear here...",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
