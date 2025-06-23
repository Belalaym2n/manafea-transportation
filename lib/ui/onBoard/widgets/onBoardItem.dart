import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/appConstants.dart';
import '../../../domain/models/onBoardModel/onBoardModel.dart';
import 'animationDo.dart';

class OnBoardItem extends StatefulWidget {
    OnBoardItem({super.key,required this.currentStep});
int currentStep;
  @override
  State<OnBoardItem> createState() => _OnBoardItemState();
}

class _OnBoardItemState extends State<OnBoardItem> {

@override
  Widget build(BuildContext context) {
  final List<OnBoardModel> items = OnBoardModel.getItems(context);
  _buildImage() {
    return Container(
        margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
        width: AppConstants.screenWidth,
        height: AppConstants.screenHeight / 2.9,
        child: animationDo(

            widget.currentStep, 100,
            Image.asset(items[widget.currentStep].imageUrl)));
  }
  _buildDescriptionText() {
    return animationDo(
      widget.currentStep   ,
        500,
        Text(
          items[ widget.currentStep].description,
          style: TextStyle(
            fontSize:
            AppConstants.screenWidth*0.05
            ,
            color: Colors.blueGrey[700],
            height: 1.5,
          ),
          textAlign: TextAlign.start,
        ));
  }

  return Column(
      children: [
        _buildImage(),
        _buildDescriptionText()

      ],
    );
  }

}
