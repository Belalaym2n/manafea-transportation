

  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appConstants.dart';

Widget buildScreenName() {
    return Text(
      "Orders",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: AppConstants.screenWidth * 0.055,
        letterSpacing: 1.2,
        color: Colors.black87,
        overflow: TextOverflow.ellipsis,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      ),
    );
  }

