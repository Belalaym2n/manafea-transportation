import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/ui/home/widgets/transportation_widget.dart';
import 'package:manafea/ui/home/widgets/travelWidget.dart';
import 'package:manafea/ui/home/widgets/welcomUser.dart';

import '../../profile_screen/view/profileScreen.dart';
import '../../profile_screen/widgets/profileScreenItem.dart';
import 'carsuoImage.dart';
import 'hotelWidget.dart';

class HomeScreenItem extends StatefulWidget {
  const HomeScreenItem({super.key});

  @override
  State<HomeScreenItem> createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  @override
  Widget build(BuildContext context) {
    return   const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(child: ProfileScreen()),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeUserWidget(),

              SizedBox(height: 210, child: CasualImage()),
              SizedBox(height: 10),
              TransportationWidget(),
              SizedBox(height: 10),
              HotelWidget(),
              SizedBox(height: 10),
              TravelWidget(),
              SizedBox(height: 14),



            ],
          ),
        ),
      ),
    );
  }
}
