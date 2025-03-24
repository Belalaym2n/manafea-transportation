import 'package:flutter/cupertino.dart';

import '../widgets/cars_screen_item.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarBookingScreenState();
}

class _CarBookingScreenState extends State<CarsScreen> {
  @override
  Widget build(BuildContext context) {
    return const CarScreenItem();
  }
}
