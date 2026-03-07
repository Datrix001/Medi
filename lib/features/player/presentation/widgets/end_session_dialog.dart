import 'package:flutter/material.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/styles/app_text.dart';

class EndSessionDialog extends StatelessWidget {
  const EndSessionDialog({super.key});

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const EndSessionDialog(),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF4A8A8A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: appTextH3('End Session?', color: AppColors.white),
      content: appTextB1(
        'Are you sure you want to end this session?',
        color: AppColors.white.withOpacity(0.7),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.white.withOpacity(0.7),
          ),
          child: appTextB1('Cancel', color: AppColors.white.withOpacity(0.7)),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white.withOpacity(0.25),
            foregroundColor: AppColors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: appTextB1('End', color: AppColors.white),
        ),
      ],
    );
  }
}
