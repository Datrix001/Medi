import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';
import 'package:medi_app/features/journal/presentation/screens/reflection_screen.dart';
import 'package:medi_app/features/player/presentation/cubit/player_cubit.dart';
import 'package:medi_app/features/player/presentation/widgets/end_session_dialog.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/custom_button.dart';
import 'package:medi_app/utils/styles/app_text.dart';

class PlayerScreen extends StatefulWidget {
  final AmbienceModel model;
  static const routeName = "/player";

  const PlayerScreen({super.key, required this.model});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );

    context.read<PlayerCubit>().startSession(widget.model);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> _onEndSession() async {
    final confirmed = await EndSessionDialog.show(context);
    if (confirmed && mounted) {
      await context.read<PlayerCubit>().stopSession();
      context.pushReplacement(ReflectionScreen.routeName, extra: widget.model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) context.pop();
      },
      child: BlocListener<PlayerCubit, PlayerState>(
        listenWhen: (prev, curr) => curr.sessionExpired && !prev.sessionExpired,
        listener: (context, state) {
          context.read<PlayerCubit>().clearExpired();
          context.pushReplacement(
            ReflectionScreen.routeName,
            extra: widget.model,
          );
        },
        child: BlocBuilder<PlayerCubit, PlayerState>(
          builder: (context, state) {
            final cubit = context.read<PlayerCubit>();

            return Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(widget.model.image, fit: BoxFit.cover),

                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black26, Colors.black54],
                      ),
                    ),
                  ),

                  SafeArea(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: AppColors.white,
                            ),
                            onPressed: () => context.pop(),
                          ),
                        ),

                        const Spacer(),

                        AnimatedBuilder(
                          animation: _scaleAnimation,
                          builder: (_, child) => Transform.scale(
                            scale: _scaleAnimation.value,
                            child: child,
                          ),
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white.withOpacity(0.15),
                              border: Border.all(
                                color: AppColors.white.withOpacity(0.3),
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        appTextS2(
                          widget.model.title,
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),

                        const SizedBox(height: 30),

                        StreamBuilder<bool>(
                          stream: cubit.player.playingStream,
                          initialData: cubit.player.playing,
                          builder: (context, snapshot) {
                            final isPlaying = snapshot.data ?? false;
                            return GestureDetector(
                              onTap: cubit.togglePlayPause,
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white.withOpacity(0.2),
                                  border: Border.all(
                                    color: AppColors.white.withOpacity(0.4),
                                  ),
                                ),
                                child: Icon(
                                  isPlaying ? Icons.pause : Icons.play_arrow,
                                  color: AppColors.white,
                                  size: 36,
                                ),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 40),

                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: AppColors.white,
                            activeTrackColor: AppColors.white,
                            inactiveTrackColor: AppColors.white.withOpacity(
                              0.3,
                            ),
                            overlayColor: AppColors.white.withOpacity(0.24),
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 6,
                            ),
                            trackHeight: 2,
                          ),
                          child: Slider(
                            value:
                                state.progress *
                                state.sessionDuration.inSeconds.toDouble(),
                            max: state.sessionDuration.inSeconds > 0
                                ? state.sessionDuration.inSeconds.toDouble()
                                : 1,
                            onChanged: (value) =>
                                cubit.seek(Duration(seconds: value.toInt())),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              appTextB2(
                                state.elapsedLabel,
                                color: AppColors.white.withOpacity(0.7),
                              ),
                              appTextB2(
                                state.durationLabel,
                                color: AppColors.white.withOpacity(0.7),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: CustomButton(
                            buttonText: 'End Session',
                            onTap: _onEndSession,
                          ),
                        ),

                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
