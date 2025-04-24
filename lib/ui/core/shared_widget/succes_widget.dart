import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';
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
        backgroundColor:
        AppColors.primaryColor.withOpacity(0.05),
        body: FadeTransition(
          opacity: _fadeIn,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 24),
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
                  const SizedBox(height: 20),
                  headLineText(),
                  const SizedBox(height: 12),
                  descriptionText(),
                  const Spacer(),
                  customButton(
                    label: "Back to Home",
                    onPressed: () {},
                  ),
                  const SizedBox(height: 8),
                  customButton(
                    label: "Go to Orders",
                    bgColor: Colors.green,
                    onPressed: () {},
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
      "Your order has been successfully placed.\nWe will deliver your order soon.",
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
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(16),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 32,
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
        AppConstants.screenWidth * 0.5 ,
        AppConstants.screenHeight * 0.045,
      ),
    );
  }

  Text headLineText() {
    return Text(
      "Order Successfully\nPlaced",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: AppConstants.screenWidth * 0.055,
        color: AppColors.primaryColor,
      ),
    );
  }
}
