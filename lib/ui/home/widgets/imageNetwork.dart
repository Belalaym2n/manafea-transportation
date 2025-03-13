import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imageNetwork({
  required String image
}) {
  return Stack(
    children: [
      Container(
        width: 158,
        height: 85,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image:  DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Positioned(
        top: 4, // تعديل الموقع العلوي
        right: 5, // تعديل الموقع الجانبي
        child: Container(
          width: 30, // تعديل الحجم
          height: 30, // تعديل الحجم
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.favorite_border,
            size: 20, // ضبط حجم الأيقونة
            color: Colors.red, // لون الأيقونة
          ),
        ),
      ),
    ],
  );
}

