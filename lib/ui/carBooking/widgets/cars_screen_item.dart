import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/routing/appRoutes.dart';
import 'package:manafea/ui/carBooking/view/car_bookin_screen.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';

class CarScreenItem extends StatefulWidget {
  const CarScreenItem({super.key});

  @override
  State<CarScreenItem> createState() => _CarBookingScreenItemState();
}

class _CarBookingScreenItemState extends State<CarScreenItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Available Cars",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // سيارتين في كل صف
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8, // التحكم في أبعاد الودجت
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
        borderRadius: BorderRadius.circular(16),
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
                height: 110, fit: BoxFit.cover, width: double.infinity),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text("BMW X5",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
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
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "\$110/day",
                style: TextStyle(fontSize: 14, color: Colors.black54),
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
