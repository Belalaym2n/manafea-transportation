import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../domain/models/onBoardModel.dart';
import 'animationDo.dart';

class OnBoardItem extends StatefulWidget {
   OnBoardItem({super.key,required this.index});

   int index;
  @override
  State<OnBoardItem> createState() => _OnBoardItemState();
}

class _OnBoardItemState extends State<OnBoardItem> {
  List<OnBoardModel> items = OnBoardModel.items;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: AppConstants.screenWidth,
      height: AppConstants.screenHeight,
      child: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
              width: AppConstants.screenWidth,
              height: AppConstants.screenHeight / 2.9,
              child: animationDo(
                widget.index,
                100,
                Image.asset(items[widget.index].imageUrl,

                  fit: widget.index==0?BoxFit.fill:
                  BoxFit.cover,

                ),
              ),
            ),

            Padding(
                padding:
                const EdgeInsets.only(top: 25, bottom: 15),
                child: animationDo(
                  widget.index,
                  300,
                  Text(
                    items[widget.index].headline,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants.screenWidth * 0.076),
                  ),
                )),

            animationDo(
              widget.index,
              500,
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    items[widget.index].description,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: AppConstants.screenWidth * 0.03),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
