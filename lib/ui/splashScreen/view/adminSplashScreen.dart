import 'package:flutter/material.dart';

import '../../../routing/appRoutes.dart';

class AdminSplashScreen extends StatefulWidget {
  const AdminSplashScreen({super.key});

  @override
  State<AdminSplashScreen> createState() => _AdminSplashScreenState();
}

class _AdminSplashScreenState extends State<AdminSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.autoLoginAdmin,
            (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // يمكنك إضافة لوجو أو صورة متحركة هنا إن أردت
            // Lottie.asset('assets/animations/admin.json', height: 150),

            const Icon(
              Icons.admin_panel_settings,
              size: 80,
              color: Color(0xFFE3652F), // لون برتقالي فاتح
            ),
            const SizedBox(height: 20),
            const Text(
              "مرحباً بك",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00456B), // أزرق داكن
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "لوحة تحكم مانفع",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
