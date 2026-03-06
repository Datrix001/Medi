import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/styles/text_size.dart';

final class AppTextStyles {
  AppTextStyles._();

  static TextStyle get h1 =>
      TextStyle(fontSize: AppFontSize.size40.sp, color: AppColors.black);

  static TextStyle get h2 =>
      TextStyle(fontSize: AppFontSize.size32.sp, color: AppColors.black);

  static TextStyle get h3 =>
      TextStyle(fontSize: AppFontSize.size20.sp, color: AppColors.black);

  static TextStyle get s1 => TextStyle(
    fontSize: AppFontSize.size24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle get s2 => TextStyle(
    fontSize: AppFontSize.size20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle get s3 => TextStyle(
    fontSize: AppFontSize.size16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle get s4 => TextStyle(
    fontSize: AppFontSize.size16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle get b1 => TextStyle(
    fontSize: AppFontSize.size14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle get b2 => TextStyle(
    fontSize: AppFontSize.size12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
}
