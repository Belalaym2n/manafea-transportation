import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../config/appImages.dart';
import '../../../generated/locale_keys.g.dart';

class OnBoardModel {
  String imageUrl;
  String headline;
  String description;

  OnBoardModel({
    required this.imageUrl,
    required this.headline,
    required this.description,
  });

  static List<OnBoardModel> getItems(BuildContext context) {
    return [
      OnBoardModel(
        imageUrl: AppImages.onBoardImageOne,
        headline: LocaleKeys.onboard_1_headline.tr(),
        description: LocaleKeys.onboard_1_description.tr(),
      ),
      OnBoardModel(
        imageUrl: AppImages.onBoardImageOne,
        headline: LocaleKeys.onboard_2_headline.tr(),
        description: LocaleKeys.onboard_2_description.tr(),
      ),
      OnBoardModel(
        imageUrl: AppImages.onBoardImageTwo,
        headline: LocaleKeys.onboard_3_headline.tr(),
        description: LocaleKeys.onboard_3_description.tr(),
      ),
      OnBoardModel(
        imageUrl: AppImages.onBoardImageThree,
        headline: LocaleKeys.onboard_4_headline.tr(),
        description: LocaleKeys.onboard_4_description.tr(),
      ),
    ];
  }
}
