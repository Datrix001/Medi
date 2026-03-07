import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_app/features/player/presentation/cubit/player_cubit.dart';
import 'package:medi_app/features/player/presentation/screens/player_screen.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/styles/app_text.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerState>(
      builder: (context, state) {
        final cubit = context.read<PlayerCubit>();

        return Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () =>
                context.push(PlayerScreen.routeName, extra: cubit.currentModel),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6BA8A9), Color(0xFF7FBF7F)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(
                    value: state.progress,
                    backgroundColor: AppColors.white.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.white,
                    ),
                    minHeight: 2,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white.withOpacity(0.2),
                          ),
                          child: const Icon(
                            Icons.self_improvement,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appTextB1(
                                cubit.currentModel?.title ?? '',
                                color: AppColors.white,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              appTextB2(
                                '${state.elapsedLabel} / ${state.durationLabel}',
                                color: AppColors.white.withOpacity(0.6),
                              ),
                            ],
                          ),
                        ),

                        StreamBuilder<bool>(
                          stream: cubit.player.playingStream,
                          initialData: cubit.player.playing,
                          builder: (context, snapshot) {
                            final isPlaying = snapshot.data ?? false;
                            return IconButton(
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: AppColors.white,
                              ),
                              onPressed: cubit.togglePlayPause,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
