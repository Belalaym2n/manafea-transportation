import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';
import 'package:manafea/ui/userOrders/view/userOrders.dart';
import '../../../config/appColors.dart';

class SuccessOrder extends StatefulWidget {
  const SuccessOrder({super.key});

  @override
  State<SuccessOrder> createState() => _SuccessOrderState();
}

class _SuccessOrderState extends State<SuccessOrder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(0.05),
        body: FadeTransition(
          opacity: _fadeIn,
          child: Center(
            child: Container(
              padding:   EdgeInsets.all(AppConstants.screenWidth*0.067),
              margin:   EdgeInsets.symmetric(horizontal:
              AppConstants.screenHeight*0.067),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              height: AppConstants.screenHeight * 0.6,
              width: double.infinity,
              child: Column(
                children: [
                  const Spacer(),
                  successIcon(),
                    SizedBox(height: AppConstants.screenHeight*0.03),
                  headLineText(),
                  SizedBox(height: AppConstants.screenHeight*0.015),
                  descriptionText(),
                  const Spacer(),
                  customButton(
                    label: LocaleKeys.success_widget_back_to_home.tr(),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.bottomNav,

                      );
                    },
                  ),
                  SizedBox(height: AppConstants.screenHeight * 0.01),
                  customButton(
                    label: LocaleKeys.success_widget_go_to_orders.tr(),
                    bgColor: Colors.green,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.orders,

                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget descriptionText() {
    return Text(
      LocaleKeys.success_screen_order_successfully_placed_message
        .tr(),
      style: TextStyle(
        fontSize: AppConstants.screenWidth * 0.035,
        color: Colors.grey[700],
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget successIcon() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(AppConstants.screenWidth * 0.045),
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: AppConstants.screenWidth * 0.097,
      ),
    );
  }

  Widget customButton({
    required String label,
    required VoidCallback onPressed,
    Color? bgColor,
  }) {
    return elevated_button(
      buttonName: label,
      onPressed: onPressed,
      bgColor: bgColor ?? AppColors.primaryColor,
      valid: true,
      buttonSize: Size(
        AppConstants.screenWidth * 0.6,
        AppConstants.screenHeight * 0.045,
      ),
    );
  }

  Text headLineText() {
    return Text(
      LocaleKeys.success_screen_order_successfully_placed.tr(),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: AppConstants.screenWidth * 0.055,
        color: AppColors.primaryColor,
      ),
    );
  }
}
