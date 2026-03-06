import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_app/features/ambience/model/ambience_model.dart';
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
  final ValueNotifier<AmbienceType> currentAmbience = ValueNotifier(
    AmbienceType.all,
  );
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<String> searchQuery = ValueNotifier('');
  final List<String> typesOfAmbiences = [
    'All',
    'Focus',
    'Calm',
    'Sleep',
    'Reset',
  ];

  final List<AmbienceModel> ambiences = [
    AmbienceModel(
      image: Assets.png.forest.path,
      title: "Forest Awakening",
      time: "3 min",
      type: AmbienceType.focus,
    ),
    AmbienceModel(
      image: Assets.png.lake.path,
      title: "Sunset Lake",
      time: "2 min",
      type: AmbienceType.focus,
    ),
    AmbienceModel(
      image: Assets.png.mountain.path,
      title: "Mountain Stillness",
      time: "3 min",
      type: AmbienceType.rest,
    ),
    AmbienceModel(
      image: Assets.png.zen.path,
      title: "Zen Garden",
      time: "3 min",
      type: AmbienceType.rest,
    ),
    AmbienceModel(
      image: Assets.png.waves.path,
      title: "Ocean Waves",
      time: "2 min",
      type: AmbienceType.calm,
    ),
    AmbienceModel(
      image: Assets.png.misty.path,
      title: "Misty Morning",
      time: "2 min",
      type: AmbienceType.sleep,
    ),
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
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: TextField(
                textInputAction: TextInputAction.search,
                controller: searchController,
                onChanged: (value) {
                  searchQuery.value = value;
                },
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: AppColors.black.withAlpha(70),
                  ),
                  hintText: "Search ambiences...",
                  border: InputBorder.none,
                ),
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
                          currentAmbience.value = AmbienceType.values[index];
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
            ValueListenableBuilder(
              valueListenable: currentAmbience,
              builder: (context, type, child) {
                return ValueListenableBuilder(
                  valueListenable: searchQuery,
                  builder: (context, query, child) {
                    final filteredAmbiences = ambiences.where((a) {
                      final matchesType =
                          currentAmbience.value == AmbienceType.all ||
                          a.type == currentAmbience.value;

                      final matchesSearch =
                          a.title.toLowerCase().contains(query.toLowerCase()) ||
                          a.type.name.toLowerCase().contains(
                            query.toLowerCase(),
                          );

                      return matchesType && matchesSearch;
                    }).toList();

                    if (filteredAmbiences.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: appTextB1("No ambiences found"),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredAmbiences.length,
                      itemBuilder: (context, index) {
                        final ambience = filteredAmbiences[index];

                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: AmbineceCard(
                            image: ambience.image,
                            title: ambience.title,
                            time: ambience.time,
                            type: ambience.type,
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
