import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/styles/app_text.dart';

class Utils {
  static Widget? typeAndColor(AmbienceType type) {
    switch (type) {
      case AmbienceType.calm:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),

          decoration: BoxDecoration(
            color: AppColors.green.withAlpha(90),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: appTextB1('Calm', color: AppColors.green),
        );

      case AmbienceType.focus:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: AppColors.purple.withAlpha(90),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: appTextB1('Focus', color: AppColors.purple.withAlpha(110)),
        );

      case AmbienceType.rest:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),

          decoration: BoxDecoration(
            color: AppColors.blue.withAlpha(90),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: appTextB1('Rest', color: AppColors.blue.withAlpha(120)),
        );

      case AmbienceType.sleep:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),

          decoration: BoxDecoration(
            color: AppColors.red.withAlpha(90),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: appTextB1('Sleep', color: AppColors.red.withAlpha(120)),
        );
      case AmbienceType.all:
        return null;
    }
  }

  static Widget? typeAndColor1(FeelingsType type, bool isSelected) {
    switch (type) {
      case FeelingsType.calm:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),

          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.green.withAlpha(150)
                : AppColors.green.withAlpha(90),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: appTextB1(
            'Calm',
            color: isSelected ? AppColors.white : AppColors.green,
          ),
        );

      case FeelingsType.sleepy:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.purple.withAlpha(150)
                : AppColors.purple.withAlpha(90),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: appTextB1(
            'Grounded',
            color: isSelected
                ? AppColors.white
                : AppColors.purple.withAlpha(110),
          ),
        );

      case FeelingsType.grounded:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),

          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.blue.withAlpha(150)
                : AppColors.blue.withAlpha(90),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: appTextB1(
            'Energized',
            color: isSelected ? AppColors.white : AppColors.blue.withAlpha(120),
          ),
        );

      case FeelingsType.energized:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),

          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.red.withAlpha(150)
                : AppColors.red.withAlpha(90),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: appTextB1(
            'Sleepy',
            color: isSelected ? AppColors.white : AppColors.red.withAlpha(120),
          ),
        );
    }
  }
}
