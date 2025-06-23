import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manafea/generated/locale_keys.g.dart';
import 'package:manafea/ui/core/shared_widget/elevatedButton.dart';
import 'package:manafea/ui/onBoard/widgets/onBoardItem.dart';
import 'package:provider/provider.dart';

import '../../../config/appColors.dart';
import '../../../config/appConstants.dart';
import '../../../config/localization/localization.dart';
import '../../../domain/models/onBoardModel/onBoardModel.dart';
import '../../auth/view/withPhone/loginScreen.dart';
import '../widgets/animationDo.dart';
import '../widgets/chooseLanguage.dart';

class OnBoardScreen extends StatefulWidget {
  OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardItemState();
}

class _OnBoardItemState extends State<OnBoardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _currentStep = 0;
  int languageIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<OnBoardModel> items = OnBoardModel.getItems(context);

    final int _totalSteps = items.length; // عدد المراحل
    void _nextStep() {
      if (_currentStep < _totalSteps - 1) {
        setState(() {
          _currentStep++;
        });
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    }

    void _prevStep() {
      if (_currentStep > 0) {
        setState(() {
          _currentStep--;
        });
      }
    }

    // 1/0 1  => 0.025
    double progress = (_currentStep + 1) / _totalSteps;
    _buildLineIndicator() {
      return Expanded(
        child: Stack(
          children: [
            Container(
              height: AppConstants.screenHeight * 0.0085,
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
                  height: AppConstants.screenHeight * 0.0085,
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

    _buildBackIcon() {
      return Container(
        width: AppConstants.screenWidth * 0.096,
        decoration: const BoxDecoration(
            color: Color(0xFFdcdcdc), shape: BoxShape.circle),
        child: Center(
          child: IconButton(
            icon: Icon(Icons.arrow_back,
                size: AppConstants.screenWidth * 0.065,
                color: AppColors.primaryColor),
            onPressed: _prevStep,
          ),
        ),
      );
    }

    _buildHeaderScreen() {
      return Row(children: [
        _buildBackIcon(),
        SizedBox(
          width: AppConstants.screenWidth * 0.04,
        ),
        _buildLineIndicator(),
      ]);
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
              style: TextStyle(
                  fontSize: //22
                      AppConstants.screenWidth * 0.062,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          )
        ],
      );
    }


    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppConstants.screenWidth * 0.057),
          child: SizedBox(
            width: AppConstants.screenWidth,
            height: AppConstants.screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildHeaderScreen(),
                SizedBox(
                  height: AppConstants.screenHeight * 0.023,
                ),
                _buildHeadLineText(),
                _currentStep != 0
                    ? const SizedBox()
                    : SizedBox(
                        height: AppConstants.screenHeight * 0.12,
                      ),
                _currentStep != 0
                    ? OnBoardItem(currentStep: _currentStep)
                    : languageWidget(
                        languageIndex: languageIndex,
                        context: context,
                        setState1: () => setState(() {
                          languageIndex = 1;
                        }),
                        setState2: () => setState(() {
                          languageIndex = 2;
                        }),
                        setState3: () => setState(() {
                          languageIndex = 3;
                        }),
                      ),
                const Spacer(),
                elevated_button(
                    onPressed: () {
                      _currentStep == _totalSteps - 1 && languageIndex == -1
                          ? SizedBox()
                          : _nextStep();
                    },
                    buttonName: LocaleKeys.buttons_name_continue.tr(),
                    valid: _currentStep == 0 && languageIndex != -1
                        ? true
                        : _currentStep <= _totalSteps - 1 && languageIndex != -1
                            ? true
                            : false),
                SizedBox(
                  height: AppConstants.screenHeight * 0.03,
                ),
              ],
            ),
          )),
    ));
  }
}
