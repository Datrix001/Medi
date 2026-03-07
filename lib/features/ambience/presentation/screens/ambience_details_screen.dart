import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';
import 'package:medi_app/features/ambience/presentation/widgets/sensory_elements.dart';
import 'package:medi_app/features/player/presentation/cubit/player_cubit.dart';
import 'package:medi_app/features/player/presentation/screens/player_screen.dart';
import 'package:medi_app/features/player/presentation/widgets/mini_player.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/custom_button.dart';
import 'package:medi_app/utils/styles/app_text.dart';
import 'package:medi_app/utils/utils.dart';

class AmbienceDetailsScreen extends StatelessWidget {
  final AmbienceModel model;
  static const routeName = "/ambience-details";

  const AmbienceDetailsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.transparent,
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 300.h,
                    child: Image.asset(model.image, fit: BoxFit.fill),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              appTextS2(model.title),
                              const Spacer(),
                              appTextB2(
                                model.time,
                                color: AppColors.black.withAlpha(70),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.w),
                            child: Utils.typeAndColor(model.type),
                          ),
                          appTextB1(
                            model.ambienceDetails.details,
                            textAlign: TextAlign.start,
                            color: AppColors.black.withAlpha(110),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.w),
                            child: appTextB1(
                              "Sensory Elements",
                              color: AppColors.black.withAlpha(70),
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  model.ambienceDetails.sensoryElements.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.w,
                                  ),
                                  child: SensoryElements(
                                    title: model
                                        .ambienceDetails
                                        .sensoryElements[index],
                                  ),
                                );
                              },
                            ),
                          ),
                          20.verticalSpace,

                          BlocBuilder<PlayerCubit, PlayerState>(
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: state.sessionActive ? 72.h : 0,
                                ),
                                child: CustomButton(
                                  buttonText: "Start Session",
                                  onTap: () => context.push(
                                    PlayerScreen.routeName,
                                    extra: model,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
}
