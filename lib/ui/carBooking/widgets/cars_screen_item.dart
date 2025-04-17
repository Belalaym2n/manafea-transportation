import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/carBooking/view/car_bookin_screen.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';

class CarScreenItem extends StatefulWidget {
  const CarScreenItem({super.key});

  @override
  State<CarScreenItem> createState() => _CarBookingScreenItemState();
}

class _CarBookingScreenItemState extends State<CarScreenItem> {
double aspectRatio=
    (1.73*(AppConstants.screenWidth*0.1))/AppConstants.screenHeight*0.1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,

        title: const Text("Available Cars",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding:   EdgeInsets.all(AppConstants.screenWidth*0.036),
        child: GridView.builder(
          gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // سيارتين في كل صف
            crossAxisSpacing: AppConstants.screenWidth*0.03,
            mainAxisSpacing: AppConstants.screenHeight*0.017,
            childAspectRatio:     0.8          , // التحكم في أبعاد الودجت
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            return _buildCarCard();
          },
        ),
      ),
    ));
  }

  _buildCarCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.screenWidth*0.039),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset("assets/images/car.jpg",
                height: AppConstants.screenHeight*0.14,
                fit: BoxFit.cover, width: double.infinity),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:
            AppConstants.screenWidth*0.02
            ),
            child: Text("BMW X5",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: AppConstants.screenWidth*0.038,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        //blurRadius: 4,
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(1, 0),
                      )
                    ])),
          ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.screenWidth*0.02),
              child: Text(
                "\$110/day",
                style: TextStyle(       fontSize: AppConstants.screenWidth*0.038,
                    color: Colors.black54),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: smallElevatedButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        const CarBookingScreen()),
                  );
                },
                buttonName: "Book Now"),
          ),
        ],
      ),
    );
  }


}
