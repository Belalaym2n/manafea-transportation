 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../config/appImages.dart';
import '../../../generated/locale_keys.g.dart';
 import 'chooseLocationPicker.dart';

class BuildHeaderForChooseSpecificLocation extends StatefulWidget {
     BuildHeaderForChooseSpecificLocation({super.key  ,
     required this.isSearchPressed,
     required this.getServiceItems,
     required this.changeSearchBool,
     required this.location,
     required this.changeLocation,
     required this.questionText,
   });

   String? location;
   Function(String,String) changeLocation;
   bool isSearchPressed;
     Widget questionText;

   Function getServiceItems;
   Function changeSearchBool;
   @override
   State<BuildHeaderForChooseSpecificLocation> createState() => _BuildHeaderForChooseSpecificLocationState();
 }

 class _BuildHeaderForChooseSpecificLocationState extends State<BuildHeaderForChooseSpecificLocation> {
   final List<String> location = [
     LocaleKeys.locations_riyadh,
     LocaleKeys.locations_jeddah,
     LocaleKeys.locations_makkah,
     LocaleKeys.locations_madinah,
     LocaleKeys.locations_dammam,
     LocaleKeys.locations_khobar,
     LocaleKeys.locations_taif,
     LocaleKeys.locations_buraidah,
     LocaleKeys.locations_abha,
     LocaleKeys.locations_hail,
     LocaleKeys.locations_tabuk,
     LocaleKeys.locations_yanbu,
     LocaleKeys.locations_qassim,
     LocaleKeys.locations_jazan,
     LocaleKeys.locations_najran,
     LocaleKeys.locations_al_bahah,
   ];
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
             widget.questionText,
             SizedBox(height: AppConstants.screenHeight * 0.02),
             // 2% من الارتفاع
             Row(
               children: [
                 Expanded(
                   child: InkWell(
                     onTap: () => showLocationsPicker(
                         context: context,
                         changeLocation: widget.changeLocation,
                         location: widget.location,
                         locations: location),
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
                             widget.location ?? LocaleKeys.select_a_location.tr(),
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
             ) : widget.getServiceItems(),


           ],
         ),
       ),
     );
   }

   _buildElevatedButton() {
     return ElevatedButton(
       onPressed: () {
         widget.location!=null?
         widget.changeSearchBool():null;
       },
       style: ElevatedButton.styleFrom(
         backgroundColor:

         widget.location!=null?
         AppColors.primaryColor:Colors.grey,
         padding: EdgeInsets.symmetric(
             horizontal: AppConstants.screenWidth * 0.1, // 10% من العرض
             vertical: AppConstants.screenHeight * 0.02), // 2% من الارتفاع
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
       ),
       child: Text(LocaleKeys.buttons_name_search.tr(),
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
