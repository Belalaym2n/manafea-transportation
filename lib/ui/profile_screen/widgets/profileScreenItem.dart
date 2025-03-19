import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:manafea/config/appConstants.dart';

import 'package:skeletonizer/skeletonizer.dart';

import '../../../config/appColors.dart';

class ProfileScreenItem extends StatefulWidget {
  const ProfileScreenItem({super.key});

  @override
  State<ProfileScreenItem> createState() => _ProfileScreenItemState();
}

class _ProfileScreenItemState extends State<ProfileScreenItem> {
  int index=-1;
  @override
  void initState() {
    super.initState();
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
              drawerData(
                isSelected: index==0,
                  onTap: () {
                    index=0;
                  setState(() {

                  });
                  },
                  name: "Belal Ayman",
                  icon: Icons.people,
                  iconColor: AppColors.primaryColor),
              SizedBox(height: AppConstants.screenHeight * 0.04),
              drawerData(
                isSelected: index==1,
                  onTap: () {
                    index=1;
                  setState(() {

                  });
                  },
                  name: "+966 567 34 344",
                  icon: Icons.phone,
                  iconColor: AppColors.primaryColor),
              SizedBox(height: AppConstants.screenHeight * 0.04),
              drawerData(
                isSelected: index==2,
                  onTap: (){
          index=2;
                  setState(() {

                  });
                  },
                  name: "Setting",
                  icon: Icons.settings,
                  iconColor: Colors.black),
              SizedBox(height: AppConstants.screenHeight * 0.04),
              drawerData(
                isSelected: index==3,
                  onTap: () {
                    index=3;
                  setState(() {

                  });
                  },
                  widgetIcon: icon_widget(icon: Icons.login_outlined,isSelected: index==3),
                  name: "Logout",
                  iconColor: Colors.red),
              SizedBox(height: AppConstants.screenHeight * 0.04),
              drawerData(
                isSelected: index==4,

                  widgetIcon: icon_widget(icon: Icons.login_outlined,  isSelected: index==4),
                  name: "Delete Account",
                  onTap: () {
                    index=4;
                  setState(() {

                  });
                  },
                  iconColor: Colors.red),
              SizedBox(height: AppConstants.screenHeight * 0.04),
              drawerData(
                isSelected: index==5,
                onTap: () {
                  index=5;
                  setState(() {
                    Future.delayed(Duration(
                      milliseconds: 500,

                    ),
                        ()
                        {
                          Scaffold.of(context).closeDrawer();

                        }
                    );
                  });
                },
                name: "Close",
                iconColor: Colors.red,
                widgetIcon: icon_widget(icon: Icons.close,isSelected: index==5),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> deleteAccount() async {}

  icon_widget({required IconData icon,required bool isSelected}) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(color: isSelected?AppColors.primaryColor:Colors.red, shape: BoxShape.circle),
      child: Icon(
        textDirection: TextDirection.ltr,
        weight: 23,
        icon,
        color: Colors.white,
        size: AppConstants.screenWidth * 0.05,
      ),
    );
  }

  Widget drawerData({
    IconData? icon,
    required String name,
    required bool isSelected,
    required Color iconColor,
    Widget? widgetIcon,
   required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        print("object");
        onTap();
      },
      child: Padding(
          padding:isSelected?
              EdgeInsets
              .symmetric(
              horizontal:
              AppConstants.screenWidth * 0.05): EdgeInsets
              .symmetric(
              horizontal:
              AppConstants.screenWidth * 0),
        child: Container(
          height:isSelected?AppConstants.screenHeight*0.06: AppConstants.screenHeight*0.036,

          decoration: BoxDecoration(
            color: isSelected?AppColors.primaryColor:Colors.transparent,
        borderRadius: BorderRadius.circular(AppConstants.screenWidth*0.024)
          ),
          child: Padding(
                  padding: isSelected? EdgeInsets.symmetric(
                      horizontal:
                      AppConstants.screenWidth * 0.01):EdgeInsets.symmetric(
                      horizontal:
                      AppConstants.screenWidth * 0.05),
             child:  Row(

            children: [
              icon != null
                  ? Icon(
                      icon,
                      size: AppConstants.screenWidth * 0.07,
                      color: isSelected?Colors.white:iconColor
                    )
                  : widgetIcon!,
              SizedBox(width: AppConstants.screenWidth * 0.05),
              (name.toString() ?? '').isEmpty
                  ? textLoading()
                  : Text(
                      name,
                      style: TextStyle(
                        color:isSelected?Colors.white: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: AppConstants.screenWidth * 0.045,
                      ),
                    ),
            ],
          ),
          )          ),
      ),
    );
  }

  textLoading() {
    return const Skeletonizer(child: Text("Belal Ayman"));
  }
}
