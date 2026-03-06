import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_app/features/ambience/model/ambience_model.dart';
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
}
