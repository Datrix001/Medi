import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_app/features/ambience/model/ambience_model.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/styles/app_text.dart';
import 'package:medi_app/utils/utils.dart';

class JournalCard extends StatelessWidget {
  final String date;
  final AmbienceType ambienceType;
  final String title;
  final String body;
  const JournalCard({
    super.key,
    required this.date,
    required this.ambienceType,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha(10),
            offset: Offset(0, 1),
            spreadRadius: 1,
            blurRadius: 0.9,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              appTextB2(date, color: AppColors.black.withAlpha(90)),
              Spacer(),
              ?Utils.typeAndColor(ambienceType),
            ],
          ),
          appTextS3(title),
          10.verticalSpace,
          appTextB2(body, color: AppColors.black.withAlpha(120)),
        ],
      ),
    );
  }
}
