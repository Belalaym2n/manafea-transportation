import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';
import 'package:manafea/ui/login/view/loginScreen.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../domain/models/onBoardModel.dart';
import 'animationDo.dart';

class OnBoardItem extends StatefulWidget {
  OnBoardItem({super.key, required this.index});

  int index;

  @override
  State<OnBoardItem> createState() => _OnBoardItemState();
}


class _OnBoardItemState extends State<OnBoardItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  List<OnBoardModel> items = OnBoardModel.items;
  int _currentStep = 0;
  int languageIndex=-1;
  final int _totalSteps = OnBoardModel.items.length; // عدد المراحل

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {

      setState(() {
        _currentStep++;
      });
    } else {
      Navigator.push(context, MaterialPageRoute(builder:
      (context) => const LoginScreen()));
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    // 1/0 1  => 0.025
    double progress = (_currentStep + 1) / _totalSteps;
    _buildLineIndicator() {
      return Expanded(
        child: Stack(
          children: [
            Container(
              height: 5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 5,
                  width: constraints.maxWidth * progress,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              },
            ),
          ],
        ),
      );
    } // نسبة التقدم

    _buildHeaderScreen() {
      return Row(children: [
        _buildBackIcon(),
        const SizedBox(
          width: 15,
        ),
        _buildLineIndicator(),
      ]);
    }

    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: AppConstants.screenWidth,
            height: AppConstants.screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildHeaderScreen(),
                const SizedBox(
                  height: 20,
                ),

                _buildHeadLineText(),
                _currentStep < _totalSteps - 1?
                const SizedBox(

                ):const SizedBox(height: 160,) ,
                _currentStep < _totalSteps - 1?
                _buildImage():Center(child: _buildChooseLanguage(
                  onTap: (){

                    setState(() {
                      languageIndex=1;
                    });

                  },
                     isSelected: languageIndex==1,
                  text: 'English'
                )),
                _currentStep < _totalSteps - 1?
                const SizedBox(

                ):const SizedBox(height: 30,) ,
                _currentStep < _totalSteps - 1?
                _buildDescriptionText():Center(child:
                _buildChooseLanguage(
                    onTap: (){
                      setState(() {
                        languageIndex=2;
                      });
                    },
                    isSelected: languageIndex==2,
                  text: 'عربى'
                )),
                const Spacer(),
                elevated_button(onPressed: () {
                  _currentStep == _totalSteps - 1
                      && languageIndex ==-1?
                      SizedBox():
                  _nextStep();
                    }, buttonName: "Next", valid:
                _currentStep < _totalSteps - 1 ?
                true :_currentStep == _totalSteps - 1
                    && languageIndex !=-1?
                true:false
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildChooseLanguage({
    required String text,
    required Function onTap,
    required bool isSelected
}){
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Material(
        color: isSelected ? Colors.black : const Color(0xFFdcdcdc),
        borderRadius: BorderRadius.circular(10),
        elevation: isSelected ? 10 : 0,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                ? Colors.black
                : const Color(0xFFdcdcdc), // Set black background when selected
          ),
          margin: const EdgeInsets.all(8),
          height: 40,
          width: 300,
          child: Center(child: Text(text,textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected?Colors.white:AppColors.primaryColor,
            fontSize: AppConstants.screenWidth*0.045,
            fontWeight: FontWeight.w900
          ),
          ))
        ),
      ),
    );
  }

  _buildBackIcon() {
    return Container(
      width: 35,
      decoration:
          const BoxDecoration(color: Color(0xFFdcdcdc), shape: BoxShape.circle),
      child: IconButton(
        icon: const Icon(Icons.arrow_back,

            color: AppColors.primaryColor),
        onPressed: _prevStep,
      ),
    );
  }

  _buildHeadLineText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        animationDo(
          _currentStep,
          300,
          Text(
            items[_currentStep].headline,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black),
          ),
        )
      ],
    );
  }

  _buildDescriptionText() {
    return animationDo(
        _currentStep,
        500,
        Text(
          items[_currentStep].description,
          style: TextStyle(
            fontSize: 18,
            color: Colors.blueGrey[700],
            height: 1.5,
          ),
          textAlign: TextAlign.start,
        ));
  }

  _buildImage() {
    return Container(
        margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
        width: AppConstants.screenWidth,
        height: AppConstants.screenHeight / 2.9,
        child: animationDo(
            _currentStep, 100, Image.asset(items[_currentStep].imageUrl)));
  }
}
