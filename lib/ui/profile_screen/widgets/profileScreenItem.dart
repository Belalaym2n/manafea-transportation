import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/data/services/helpers/sharedPerferance/sharedPerferanceHelper.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/routing/appRoutes.dart';

import 'package:skeletonizer/skeletonizer.dart';

import '../../../config/appColors.dart';
import '../../languagesScreen/languageScreen.dart';

class ProfileScreenItem extends StatefulWidget {
  ProfileScreenItem({
    super.key,
    required this.name,
    required this.phoneNumber,
  });

  String? name;
  String? phoneNumber;

  @override
  State<ProfileScreenItem> createState() => _ProfileScreenItemState();
}

class _ProfileScreenItemState extends State<ProfileScreenItem> {
  int index = -1;

  bool isLoginWithEmail = false;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  String? email;

  checkLogin() async {
    email = await SharedPreferencesHelper.getData(
        SharedSharedPreferencesKeys.email);
    if (email != null && email.toString().trim().isNotEmpty) {
      setState(() {
        print("email $email");
        isLoginWithEmail = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

     return Container(
      color: const Color(0xFFF5F5F5), // خلفية فاتحة ومريحة للعين
      height: AppConstants.screenHeight,
      child: AnimationLimiter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 700),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              SizedBox(height: AppConstants.screenHeight * 0.04),
              _buildDrawerData(
                  isSelected: index == 0,
                  onTap: () {
                    index = 0;
                    setState(() {});
                  },
                  name: widget.name,
                  icon: Icons.people,
                  iconColor: AppColors.primaryColor),
              SizedBox(height: AppConstants.screenHeight * 0.04),
              _buildDrawerData(
                  isSelected: index == 1,
                  onTap: () {
                    index = 1;
                    print("object");

                    setState(() {});
                  },
                  name: isLoginWithEmail == true ? email : widget.phoneNumber,
                  icon: Icons.phone,
                  iconColor: AppColors.primaryColor),
              SizedBox(height: AppConstants.screenHeight * 0.04),
              _buildDrawerData(
                  isSelected: index == 2,
                  onTap: () {
                    index = 2;
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LanguageScreen(),
                          ));
                    });
                  },
                  name: LocaleKeys.drawer_setting.tr(),
                  icon: Icons.settings,
                  iconColor: Colors.black),
              SizedBox(height: AppConstants.screenHeight * 0.04),
              _buildDrawerData(
                  isSelected: index == 3,
                  onTap: () async {
                    index = 3;
                    setState(() {});

                    await SharedPreferencesHelper.clearAll();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.login,
                      (route) => false,
                    );
                  },
                  widgetIcon: icon_widget(
                      icon: Icons.login_outlined, isSelected: index == 3),
                  name: LocaleKeys.drawer_logout.tr(),
                  iconColor: Colors.red),
              SizedBox(height: AppConstants.screenHeight * 0.04),
              _buildDrawerData(
                isSelected: index == 4,
                onTap: () {
                  index = 4;
                  setState(() {
                    Future.delayed(
                        const Duration(
                          milliseconds: 500,
                        ), () {
                      setState(() {});

                      Scaffold.of(context).closeDrawer();
                    });
                  });
                },
                name: LocaleKeys.drawer_close.tr(),
                iconColor: Colors.red,
                widgetIcon:
                    icon_widget(icon: Icons.close, isSelected: index == 5),
              )
            ],
          ),
        ),
      ),
    );
  }


  icon_widget({required IconData icon, required bool isSelected}) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.red,
          shape: BoxShape.circle),
      child: Icon(
        weight: 23,
        icon,
        color: Colors.white,
        size: AppConstants.screenWidth * 0.05,
      ),
    );
  }

  Widget _buildDrawerData({
    IconData? icon,
    required String? name,
    required bool isSelected,
    required Color iconColor,
    Widget? widgetIcon,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: isSelected
            ? EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.05)
            : EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0),
        child: Container(
            height: isSelected
                ? AppConstants.screenHeight * 0.06
                : AppConstants.screenHeight * 0.036,
            decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
                borderRadius:
                    BorderRadius.circular(AppConstants.screenWidth * 0.024)),
            child: Padding(
              padding: isSelected
                  ? EdgeInsets.symmetric(
                      horizontal: AppConstants.screenWidth * 0.01)
                  : EdgeInsets.symmetric(
                      horizontal: AppConstants.screenWidth * 0.05),
              child: Row(
                children: [
                  icon != null
                      ? Icon(icon,
                          size: AppConstants.screenWidth * 0.07,
                          color: isSelected ? Colors.white : iconColor)
                      : widgetIcon!,
                  SizedBox(width: AppConstants.screenWidth * 0.05),
                  (name.toString() ?? '').isEmpty || name == null
                      ? textLoading()
                      : Text(
                          name,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: AppConstants.screenWidth * 0.045,
                          ),
                        ),
                ],
              ),
            )),
      ),
    );
  }

  textLoading() {
    return const Skeletonizer(child: Text("Belal Ayman"));
  }
}
