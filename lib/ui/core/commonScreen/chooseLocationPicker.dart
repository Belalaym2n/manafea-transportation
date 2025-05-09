import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/generated/locale_keys.g.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';

void showLocationsPicker({
  required BuildContext context,
  required Function(String,String) changeLocation,
  required String? location,
  required List<String> locations,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Container(
        height: AppConstants.screenHeight * 0.7,
        child: StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppConstants.screenHeight * 0.02, // 2% من الارتفاع
                  horizontal: AppConstants.screenWidth * 0.04), // 4% من العرض
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LocaleKeys.select_a_location.tr(),
                      style: TextStyle(
                        fontSize: AppConstants.screenWidth * 0.06,
                        // 6% من العرض
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: AppConstants.screenHeight * 0.02),
                    // 2% من الارتفاع
                    Divider(thickness: 1.2, color: Colors.grey[300]),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        bool isSelected = location == locations[index].tr();

                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(
                              vertical: AppConstants.screenHeight *
                                  0.01), // 1% من الارتفاع
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.location_on,
                                color: isSelected ? Colors.white : Colors.red),
                            title: Text(
                              locations[index].tr(),
                              style: TextStyle(
                                fontSize: AppConstants.screenWidth * 0.04,
                                // 4% من العرض
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.primaryColor,
                              ),
                            ),
                            onTap: () async {


                              print(locations[index].tr() );
                               changeLocation(locationsname[index],locations[index].tr() );

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
              ),
            );
          },
        ),
      );
    },
  );
}
List<String>locationsname=
[
"Riyadh",
"Jeddah",
"Makkah",
"Madinah",
"Dammam",
"Khobar",
"Taif",
"Buraidah",
"Abha",
"Hail",
"Tabuk"];
