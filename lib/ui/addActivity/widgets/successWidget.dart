 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget success() {
  // تستخدم Builder عشان تضمن إن الـ context هو داخل الـ Scaffold
  return Builder(
    builder: (context) {
      // عرض SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تمت العملية بنجاح!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );

      // واجهة عرض النجاح
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            SizedBox(height: 16),
            Text(
              'Success!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
          ],
        ),
      );
    },
  );
}
