import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/config/appConstants.dart';
import '../../../../domain/models/baseOrderModel/baseOrderModel.dart';
import '../../../core/shared_widget/orderItem.dart';

class GetAdminOrdersItem extends StatefulWidget {
  GetAdminOrdersItem({
    super.key,
    required this.orderDetailedChanged,
    required this.orderType,
    required this.order,
    required this.orderName,
    required this.updateStatus,
  });

  BaseOrder order;
  Widget orderDetailedChanged;
  String orderType;
  String orderName;
  Function(String, String) updateStatus;

  @override
  State<GetAdminOrdersItem> createState() => _GetOrdersItemState();
}

class _GetOrdersItemState extends State<GetAdminOrdersItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(AppConstants.screenWidth * 0.047),
        child: PhysicalModel(
            color: Colors.white,
            elevation: 6,
            shadowColor: Colors.black.withOpacity(0.1),
            borderRadius:
                BorderRadius.circular(AppConstants.screenWidth * 0.036),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppConstants.screenWidth * 0.036),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderStatus(),
                      buildOrderHeader(
                          context: context,
                          price: widget.order.price.toString(),
                          orderInfo: orderInfo(
                            context: context,
                            name: widget.order.name,
                            phoneNumber: widget.order.phoneNumber,
                            time: widget.order.time,
                            orderName: widget.orderName,
                            orderType: widget.orderType ?? '',
                          ),
                          orderId: widget.order.id),

                      const Divider(thickness: 1, color: Colors.grey),
                      widget.orderDetailedChanged,
                      buttonsWidget(),
                        SizedBox(
                        height: 0.025*AppConstants.screenHeight,
                      )
                    ]))));
  }




  orderStatus() {
    return Padding(
      padding:   EdgeInsets.all(0.022*AppConstants.screenWidth),
      child: Container(
          width: 0.22*AppConstants.screenWidth,
          height: 0.03*AppConstants.screenHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.order.status == "Success" ? Colors.green : Colors.red,
          ),
          child: Center(
            child: Text(
              widget.order.status == "Success"
                  ? "قبول"
                  : widget.order.status == "Failed"
                      ? "رفض"
                      : "قيد الانتظار",
              style: TextStyle(
                color: widget.order.status == "Success"
                    ? Colors.white
                    : Colors.white,
              ),
            ),
          )),
    );
  }

  void showConfirmDialog({
    required BuildContext context,
    required String question,
    required VoidCallback onYes,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false, // المستخدم ما يقدر يقفله بالضغط خارج المربع
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Colors.white,
        titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        actionsPadding: const EdgeInsets.only(right: 16, bottom: 12),
        title:   Row(
          children: [
            const Icon(Icons.help_outline, color: Colors.orange),
              SizedBox(width:  0.022*AppConstants.screenHeight),
            Text(
              'تأكيد',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 0.055*AppConstants.screenWidth,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        content: Text(
          question,
          style:   TextStyle(fontSize: 0.04*AppConstants.screenWidth, color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'لا',
              style: TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding:   EdgeInsets.symmetric(horizontal: 0.055*AppConstants.screenWidth, vertical: 10),
            ),
            onPressed: () {
              onYes(); // ثم نفذ الفعل
            },
            child: const Text(
              'نعم',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
  Widget buttonsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        actionButton(
          label: 'قبول',
          color: Colors.green,
          onTap: () {
            showConfirmDialog(
              context: context,
              question: 'هل أنت متأكد أنك تريد قبول هذا الطلب؟',
              onYes: () {
                widget.updateStatus(widget.order.id, "Success");
                Navigator.pop(context);
              },
            );
          },
        ),
          SizedBox(width: 0.033*AppConstants.screenWidth),
        actionButton(
          label: 'رفض',
          color: Colors.red,
          onTap: () {
            showConfirmDialog(
              context: context,
              question: 'هل أنت متأكد أنك تريد رفض هذا الطلب؟',
              onYes: () {
                widget.updateStatus(widget.order.id, "Failed");
                Navigator.pop(context);
              },
            );
          },
        ),
        SizedBox(width: 0.033*AppConstants.screenWidth),
        actionButton(
          label: 'قيد الانتظار',
          color: Colors.orange,
          onTap: () {
            showConfirmDialog(
              context: context,
              question: 'هل تريد الإبقاء على هذا الطلب معلقًا؟',
              onYes: () async {
                await widget.updateStatus(widget.order.id, "Pending");
                Navigator.pop(context);
              },
            );
          },
        ),
      ],
    );
  }
  Widget actionButton({
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding:   EdgeInsets.symmetric(horizontal:
    0.055*AppConstants.screenWidth
            , vertical: 0.015*AppConstants.screenHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

}
