import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        child: Container(
         // padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildOrderHeader(),
              const Divider(thickness: 1, color: Colors.grey),
              buildOrderDetailed(),
              ClipRRect(
                borderRadius: const
                BorderRadius.vertical(bottom: Radius.circular(12)),
                child: SizedBox(
                  width: double.infinity,
                  height: AppConstants.screenHeight * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Cancel Order', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget buildOrderHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order ID: 34SDF4532597",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.screenWidth * 0.038,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Total Price: 143\$",
                style: TextStyle(
                  fontSize: AppConstants.screenWidth * 0.032,
                  fontWeight: FontWeight.w500,
                  color: Colors.green[700],
                ),
              ),
            ],
          ),
          Icon(Icons.info_outline_rounded, color: Colors.grey[700], size: 22),
        ],
      ),
    );
  }

  Widget buildOrderDetailed() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Common Room",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstants.screenWidth * 0.034,
                ),
              ),
              Text(
                "x2",
                style: TextStyle(
                  fontSize: AppConstants.screenWidth * 0.032,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
