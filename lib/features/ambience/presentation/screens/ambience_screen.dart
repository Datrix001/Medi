import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';
import 'package:medi_app/features/ambience/presentation/cubit/ambience_cubit.dart';
import 'package:medi_app/features/ambience/presentation/cubit/ambience_state.dart';
import 'package:medi_app/features/ambience/presentation/screens/ambience_details_screen.dart';
import 'package:medi_app/features/ambience/presentation/widgets/ambinece_card.dart';
import 'package:medi_app/features/journal/presentation/screens/journal_screen.dart';
import 'package:medi_app/features/player/presentation/cubit/player_cubit.dart';
import 'package:medi_app/features/player/presentation/widgets/mini_player.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: appTextH2('Medi'),
        actions: [
          IconButton(
            onPressed: () => context.push(JournalScreen.routeName),
            icon: const Icon(Icons.book),
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            BlocConsumer<AmbienceCubit, AmbienceState>(
              listener: (context, state) {
                if (state is AmbienceFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: appTextB1(state.errorMessage)),
                  );
                }
              },
              builder: (context, state) {
                if (state is AmbienceLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is AmbienceSuccessState) {
                  final model = state.model;

                  if (model.isEmpty) {
                    return Center(child: appTextS2("NO AMBIENCES FOUND!!!"));
                  }

                  return SingleChildScrollView(
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
                            onChanged: (value) => searchQuery.value = value,
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
                                      currentAmbience.value =
                                          AmbienceType.values[index];
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
                                        borderRadius: BorderRadius.circular(
                                          15.r,
                                        ),
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
                                final filtered = model.where((a) {
                                  final matchesType =
                                      currentAmbience.value ==
                                          AmbienceType.all ||
                                      a.type == currentAmbience.value;
                                  final matchesSearch =
                                      a.title.toLowerCase().contains(
                                        query.toLowerCase(),
                                      ) ||
                                      a.type.toString().toLowerCase().contains(
                                        query.toLowerCase(),
                                      );
                                  return matchesType && matchesSearch;
                                }).toList();

                                if (filtered.isEmpty) {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 50.h),
                                    child: appTextB1("No ambiences found"),
                                  );
                                }

                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: filtered.length,
                                  itemBuilder: (context, index) {
                                    final ambience = filtered[index];

                                    final isLast = index == filtered.length - 1;
                                    return BlocBuilder<
                                      PlayerCubit,
                                      PlayerState
                                    >(
                                      builder: (context, playerState) {
                                        return GestureDetector(
                                          onTap: () => context.push(
                                            AmbienceDetailsScreen.routeName,
                                            extra: ambience,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              bottom:
                                                  isLast &&
                                                      playerState.sessionActive
                                                  ? 72.h
                                                  : 10.h,
                                            ),
                                            child: AmbineceCard(
                                              image: ambience.image,
                                              title: ambience.title,
                                              time: ambience.time,
                                              type: ambience.type,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),

            BlocBuilder<PlayerCubit, PlayerState>(
              builder: (context, state) {
                if (!state.sessionActive) return const SizedBox.shrink();
                return const MiniPlayer();
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
