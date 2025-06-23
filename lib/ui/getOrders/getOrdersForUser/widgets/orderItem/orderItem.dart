import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
 import 'package:manafea/config/appConstants.dart';
import 'package:manafea/domain/models/baseOrderModel/baseOrderModel.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../../core/shared_widget/orderItem.dart';


class OrderItem extends StatefulWidget {
  OrderItem({
    super.key,
    required this.order,
    required this.status,
    required this.orderDetailedChanged,
    required this.cancelOrder,
    required this.orderType,
    required this.orderName,
  });

  BaseOrder order;
  Widget orderDetailedChanged;
  String orderType;
  String orderName;
  String status;
  Function(String) cancelOrder;
  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.all(AppConstants.screenWidth*0.047),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.screenWidth*0.036),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.screenWidth*0.036),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildOrderHeader(
                context: context,
                price: widget.order.price.toString(),
                  orderInfo: orderInfo(
                    context: context,
                    name: widget.order.name,
                    phoneNumber: widget.order.phoneNumber,
                    time: widget.order.time,
                    orderName:  widget.orderName,//', // أو أي نوع تريده (مثل 'Activity' أو 'طلب')
                    orderType: widget.order.service ?? '',
                  ),

                  orderId: widget.order.id
              ),
              const Divider(thickness: 1, color: Colors.grey),
              widget.orderDetailedChanged,
              if(widget.status=="Pending")
              ClipRRect(
                borderRadius:
                      BorderRadius.vertical
                      (bottom: Radius.circular(AppConstants.screenWidth*0.036)),
                child: SizedBox(
                  width: double.infinity,
                  height: AppConstants.screenHeight * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape:   RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom:
                            Radius.circular(AppConstants.screenWidth*0.036)),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => buildCancelWidget());
                    },
                    child:   Text(LocaleKeys.buttons_name_cancel_order.tr(),
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildCancelWidget() {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: PhysicalModel(
        color: Colors.white,
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.screenWidth*0.036),
        child: Container(
          height: AppConstants.screenHeight * 0.37,
          width: AppConstants.screenWidth * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.screenWidth*0.044
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '😊',
                  style: TextStyle(fontSize: AppConstants.screenWidth * 0.23),
                ),

                Text(
                LocaleKeys.buttons_name_cancel_order.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppConstants.screenWidth * 0.053,
                  ),
                ),
                  Text(
                  LocaleKeys.orders_screen_cancel_order_confirmation.tr(),

                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppConstants.screenWidth * 0.039 ,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: AppConstants.screenHeight * 0.01 ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        widget.cancelOrder(widget.order.id);
                        Navigator.pop(context, true);
                      },
                      child:   Text(
LocaleKeys.buttons_name_yes.tr()
                        ,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Action when user presses No
                        Navigator.pop(context, false);
                      },
                      child: Text(LocaleKeys.buttons_name_no.tr()),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstants.screenHeight * 0.03 ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
