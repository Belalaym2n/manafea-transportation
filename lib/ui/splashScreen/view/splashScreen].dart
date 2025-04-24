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
  late AnimationController _controller;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideUp;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _slideUp = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.forward();
    });
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.autoLogin, (route) => false
        ,);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _animatedSlide(-1, _logo()),
                  SizedBox(width: AppConstants.screenWidth*0.022),
                _animatedSlide(1, _logoText()),
              ],
            ),
            SizedBox(height: AppConstants.screenHeight * 0.02),
            FadeTransition(
              opacity: _fadeIn,
              child: SlideTransition(
                position: _slideUp,
                child: _animatedText(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Image.asset(
      AppImages.logoImageSplash,
      height: AppConstants.screenHeight * 0.06,
      width: AppConstants.screenWidth * 0.16,
      fit: BoxFit.fill,
    );
  }

  Widget _logoText() {
    return Text(
      "Manafea",
      style: TextStyle(
        color: Colors.white,
        fontSize: AppConstants.screenWidth * 0.1,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _animatedText() {
    return Text(
      "Easy Transportation",
      style: TextStyle(
        fontSize: AppConstants.screenWidth * 0.05,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  Widget _animatedSlide(double offset, Widget child) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin:
      Offset(offset, 0), end: Offset.zero),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeOutExpo,
      builder: (_, value, child) {
        return Transform.translate(
          offset: Offset(AppConstants.screenWidth * value.dx, 0),
          child: child,
        );
      },
      child: child,
    );
  }
}