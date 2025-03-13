import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/ui/home/widgets/transportation_widget.dart';
import 'package:manafea/ui/home/widgets/travelWidget.dart';
import 'package:manafea/ui/home/widgets/welcomUser.dart';

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

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeUserWidget(),

              SizedBox(height: 110, child: CasualImage()),
              SizedBox(height: 14),
              TransportationWidget(),
              SizedBox(height: 14),
              HotelWidget(),
              SizedBox(height: 14),
              TravelWidget(),
              SizedBox(height: 14),



            ],
          ),
        ),
      ),
    );
  }
}
