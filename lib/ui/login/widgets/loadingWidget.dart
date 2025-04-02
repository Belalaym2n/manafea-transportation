import 'package:flutter/material.dart';
import '../../../config/appColors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primaryColor,
          ),
          padding: const EdgeInsets.all(20),
          child: Column( // ✅ أزلنا const من هنا
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const SizedBox(height: 15),
              const Text(
                "Loading...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],

    )) );
  }
}
