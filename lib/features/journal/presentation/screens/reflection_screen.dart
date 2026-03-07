import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';
import 'package:medi_app/features/ambience/presentation/screens/ambience_details_screen.dart';
import 'package:medi_app/features/ambience/presentation/screens/ambience_screen.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/custom_button.dart';
import 'package:medi_app/utils/styles/app_text.dart';
import 'package:medi_app/utils/styles/app_text_style.dart';
import 'package:medi_app/utils/utils.dart';

class ReflectionScreen extends StatefulWidget {
  const ReflectionScreen({super.key});
  static const routeName = "/reflection-screen";

  @override
  State<ReflectionScreen> createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends State<ReflectionScreen> {
  final ValueNotifier<FeelingsType> currentFeelings = ValueNotifier(
    FeelingsType.calm,
  );
  final List<FeelingsType> getFeelings = [
    FeelingsType.calm,
    FeelingsType.energized,
    FeelingsType.grounded,
    FeelingsType.sleepy,
  ];

  final TextEditingController reflectionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: appTextH3("Reflection"),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appTextS4(
              '"What is gently peresent with you right now?"',
              color: AppColors.black.withAlpha(110),
              fontStyle: FontStyle.italic,
            ),
            20.verticalSpace,
            TextFormField(
              minLines: 5,
              maxLines: 10,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.black.withAlpha(10),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: AppColors.white),
                ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: AppColors.white),
                ),
                hintText: "Take a moment to reflect...",
                hintStyle: AppTextStyles.b1.copyWith(
                  color: AppColors.black.withAlpha(70),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: appTextB1(
                "How do you feel?",
                color: AppColors.black.withAlpha(70),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: currentFeelings,
              builder: (context, value, child) {
                return Wrap(
                  spacing: 8.w, // horizontal spacing
                  runSpacing: 8.h, // vertical spacing when it wraps
                  children: getFeelings.map((feeling) {
                    return GestureDetector(
                      onTap: () {
                        currentFeelings.value = feeling;
                      },
                      child: Utils.typeAndColor1(feeling, value == feeling),
                    );
                  }).toList(),
                );
              },
            ),
            20.verticalSpace,
            CustomButton(
              buttonText: "Save Reflection",
              onTap: () => context.pushReplacement(AmbienceScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    currentFeelings.dispose();
    reflectionController.dispose();
    super.dispose();
  }
}
