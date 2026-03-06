import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/styles/app_text.dart';

class SensoryElements extends StatelessWidget {
  final String title;
  const SensoryElements({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.black.withAlpha(20),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: appTextB1(title),
    );
  }
}
