import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import '../../../config/appColors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppConstants.screenWidth*0.41,
        height: AppConstants.screenHeight*0.19,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.screenWidth*0.036
          ),
          color: AppColors.primaryColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        padding:   EdgeInsets.all(AppConstants.screenWidth*0.054),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(

              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
              SizedBox(height: AppConstants.screenWidth*0.02),
            Text(
              LocaleKeys.loading.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: AppConstants.screenWidth*0.05,
                fontWeight: FontWeight.w600, // تحسين الوزن ليكون أكثر وضوحًا
              ),
            ),
          ],
        ),
      ),
    );
  }
}
