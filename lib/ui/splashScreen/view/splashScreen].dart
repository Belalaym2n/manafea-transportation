import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/config/appImages.dart';
import 'package:manafea/routing/appRoutes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool showText = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        showText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  horzentalAnimation(
                    offset: -1, // الصورة تبدأ من اليمين إلى المنتصف
                    childWidget: logoAnimation(),
                  ),
                  SizedBox(width: AppConstants.screenWidth * 0.0),
                  // مسافة بين الصورة والاسم
                  horzentalAnimation(
                    offset: 1, // الاسم يبدأ من اليسار إلى المنتصف
                    childWidget: logoNameAnimation(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppConstants.screenHeight * 0.01,
            ),
            AnimatedOpacity(
              opacity: showText ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500), // ظهور تدريجي سلس
              child: textAnimation(),
            ),
          ],
        ),
      ),
    );
  }

  Widget logoAnimation() {
    return Image.asset(
      AppImages.logoImageSplash,
      height: AppConstants.screenHeight * 0.05,
      width: AppConstants.screenWidth * 0.15,
      fit: BoxFit.fill,
    );
  }

  Widget logoNameAnimation() {
    return Text(
      "Manafea",
      style: TextStyle(
        color: Colors.white,
        fontSize: AppConstants.screenWidth * 0.12, // تحسين حجم النص
        fontWeight: FontWeight.bold, // جعله أوضح وأكثر احترافية
        letterSpacing: 1.2, // إضافة مسافة بين الأحرف لجمالية أكثر
      ),
    );
  }

  Widget textAnimation() {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: AppConstants.screenWidth * 0.054,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      child: AnimatedTextKit(
        onFinished: () {
          Future.delayed(const Duration(milliseconds: 10), () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.onBoard,
              (route) => false,
            );
          });
        },
        animatedTexts: [
          TypewriterAnimatedText(
            curve: Curves.easeIn,

            'Easy Transportation',
            textStyle: const TextStyle(),
            speed: const Duration(milliseconds: 100), // سرعة الكتابة
          ),
        ],
        totalRepeatCount: 1, // عدد مرات التكرار
      ),
    );
  }

  Widget horzentalAnimation(
      {required double offset, required Widget childWidget}) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(
        begin: Offset(offset, 0), // يبدأ من الاتجاه المطلوب
        end: const Offset(0, 0), // يصل إلى مكانه الطبيعي
      ),
      curve: Curves.easeOutExpo,
      // تأثير أكثر نعومة واحترافية
      duration: const Duration(milliseconds: 1500),
      builder: (context, offset, child) {
        return Transform.translate(
          offset: Offset(AppConstants.screenWidth * offset.dx, 0),
          child: child,
        );
      },
      child: childWidget,
    );
  }
}
