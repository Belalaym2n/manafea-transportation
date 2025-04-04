import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';

buildStepCounterInStepper({
  required Function increaseCount,
  required Function minusCount,
  required String title,
  required int count,
  required double totalPrice, // 👈 إضافة سعر الوحدة
  String currency = "USD", // 👈 خيار لتحديد العملة
}) {

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title, // العنوان
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 5), // مسافة بين العنوان والسعر
          Text(
            "$totalPrice $currency", // 👈 عرض السعر الإجمالي
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.green.shade700, // لون مميز للسعر
            ),
          ),

        ],
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // زر الناقص
            IconButton(
              onPressed: () => minusCount(),
              icon: Icon(Icons.remove, color: AppColors.primaryColor),
            ),

            // العدد
            Text(
              "$count",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),

            // زر الزائد
            IconButton(
              onPressed: () => increaseCount(),
              icon: Icon(Icons.add, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),

    ],
  );
}
