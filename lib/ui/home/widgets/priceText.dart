import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appConstants.dart';

Widget priceText(){
  return  Row(
    children: [
      Icon(
        Icons.monetization_on,
        color: Colors.orangeAccent, // Updated to a more vibrant and modern color
        size: 16, // Slightly increased size for better visibility
      ),
      SizedBox(width: 6),
      Text(
        "46,67€/night",
        style: TextStyle(
          color: Colors.grey[800], // Darker grey for better readability
          fontSize: AppConstants.screenWidth * 0.035, // Adjusted for better scaling
          fontWeight: FontWeight.w500, // Added weight for a more professional look
        ),
      ),
    ],
  );
}

