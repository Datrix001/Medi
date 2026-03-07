import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/styles/app_text.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onTap;
  final String buttonText;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(20.w),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.green.withAlpha(200),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: appTextB1(widget.buttonText, color: AppColors.white),
        ),
      ),
    );
  }
}
