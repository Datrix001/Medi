import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_app/features/journal/data/model/journal_model.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/styles/app_text.dart';
import 'package:medi_app/utils/utils.dart';

class JournalDetailScreen extends StatelessWidget {
  final JournalModel model;
  static const routeName = "/journal-detail";

  const JournalDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        automaticallyImplyLeading: true,
        title: appTextH3("Reflection"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date
            appTextB2(
              Utils.formatJournalDate(model.date),
              color: AppColors.black.withAlpha(90),
            ),

            12.verticalSpace,

            appTextS2(model.title),

            16.verticalSpace,

            ?Utils.typeAndColor1(model.feelingType, true),

            24.verticalSpace,

            Divider(color: AppColors.black.withAlpha(20)),

            24.verticalSpace,

            appTextS4(
              '"What is gently present with you right now?"',
              color: AppColors.black.withAlpha(110),
              fontStyle: FontStyle.italic,
            ),

            16.verticalSpace,

            appTextB1(
              model.feeling.isEmpty ? "No entry written." : model.feeling,
              color: AppColors.black.withAlpha(150),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
