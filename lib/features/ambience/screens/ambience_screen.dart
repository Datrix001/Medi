import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_app/features/ambience/widgets/ambinece_card.dart';
import 'package:medi_app/gen/assets.gen.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/styles/app_text.dart';

class AmbienceScreen extends StatefulWidget {
  static const String routeName = '/ambience-screen';

  const AmbienceScreen({super.key});

  @override
  State<AmbienceScreen> createState() => _AmbienceScreenState();
}

class _AmbienceScreenState extends State<AmbienceScreen> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);
  final List<String> typesOfAmbiences = [
    'All',
    'Focus',
    'Calm',
    'Sleep',
    'Reset',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: appTextH2('Medi'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.book))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.black.withAlpha(10),
                borderRadius: BorderRadius.circular(15.r),
              ),

              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.black.withAlpha(70)),
                  10.horizontalSpace,
                  appTextB1(
                    "Search ambiences...",
                    color: AppColors.black.withAlpha(70),
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            ValueListenableBuilder(
              valueListenable: currentIndex,
              builder: (context, value, child) {
                return SizedBox(
                  height: 30.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: typesOfAmbiences.length,
                    itemBuilder: (context, index) {
                      final isSelected = value == index;
                      return GestureDetector(
                        onTap: () {
                          currentIndex.value = index;
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.green
                                : AppColors.black.withAlpha(10),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: appTextB1(
                            typesOfAmbiences[index],
                            color: isSelected
                                ? AppColors.white
                                : AppColors.green.withAlpha(180),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            20.verticalSpace,

            AmbineceCard(
              image: Assets.png.forest.path,
              title: "Forest Awakeing",
              time: "3 min",
              type: AmbienceType.focus,
            ),
            10.verticalSpace,

            AmbineceCard(
              image: Assets.png.lake.path,

              title: "Sunset Lake",
              time: "2 min",
              type: AmbienceType.focus,
            ),
            10.verticalSpace,

            AmbineceCard(
              image: Assets.png.mountain.path,

              title: "Mountain Stillness",
              time: "3 min",
              type: AmbienceType.rest,
            ),
            10.verticalSpace,

            AmbineceCard(
              image: Assets.png.zen.path,

              title: "Zen Garden",
              time: "3 min",
              type: AmbienceType.rest,
            ),

            10.verticalSpace,
            AmbineceCard(
              image: Assets.png.waves.path,

              title: "Ocean Waves",
              time: "2 min",
              type: AmbienceType.calm,
            ),
            10.verticalSpace,

            AmbineceCard(
              image: Assets.png.misty.path,

              title: "Misty Morning",
              time: "2 min",
              type: AmbienceType.sleep,
            ),
          ],
        ),
      ),
    );
  }
}

enum AmbienceType { focus, calm, sleep, rest }
