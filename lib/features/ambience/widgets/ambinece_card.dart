import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_app/features/ambience/screens/ambience_screen.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/styles/app_text.dart';

class AmbineceCard extends StatefulWidget {
  final String image;
  final String title;
  final String time;
  final AmbienceType type;

  const AmbineceCard({
    super.key,
    required this.title,
    required this.time,
    required this.type,
    required this.image,
  });

  @override
  State<AmbineceCard> createState() => _AmbineceCardState();
}

class _AmbineceCardState extends State<AmbineceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha(10),
            offset: Offset(0, 1),
            spreadRadius: 1,
            blurRadius: 0.9,
          ),
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
            child: SizedBox(
              height: 115.h,
              width: double.infinity,
              child: Image.asset(widget.image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: Row(
              children: [
                appTextS2(widget.title),
                Spacer(),
                appTextB1(widget.time, color: AppColors.black.withAlpha(70)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: typeAndColor(widget.type),
          ),
        ],
      ),
    );
  }

  Widget typeAndColor(AmbienceType type) {
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
    }
  }
}
