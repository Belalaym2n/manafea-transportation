import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/ui/home/widgets/transportation_widget.dart';
import 'package:manafea/ui/home/widgets/welcomUser.dart';
import 'package:manafea/ui/hotels/hotels/view/recomendedHotels.dart';

import '../../../config/appConstants.dart';
import '../../profile_screen/view/profileScreen.dart';
import '../../profile_screen/widgets/profileScreenItem.dart';
import '../widgets/carsuoImage.dart';

class HomeScreenItem extends StatefulWidget {
  HomeScreenItem({
    super.key,
    required this.name,
    required this.phoneNumber,
  });

  String? phoneNumber;
  String? name;

  @override
  State<HomeScreenItem> createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
            child: ProfileScreen(
          phoneNumber: widget.phoneNumber,
          name: widget.name,
        )),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeUserWidget(
                name: widget.name,
              ),
              SizedBox(
                height: AppConstants.screenHeight * 0.25,
                child: const CasualImage(),
              ),
              const SizedBox(height: 10),
              const ServicesWidget(),
              SizedBox(height: AppConstants.screenHeight * 0.013),
              const RecommendedHotels(),
              SizedBox(height: AppConstants.screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
