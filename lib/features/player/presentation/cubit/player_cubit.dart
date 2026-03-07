import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  final AudioPlayer player = AudioPlayer();
  AmbienceModel? currentModel;

  Timer? _timer;

  PlayerCubit() : super(const PlayerState());

  Future<void> startSession(AmbienceModel model) async {
    if (state.sessionActive && currentModel?.title == model.title) return;

    _timer?.cancel();
    currentModel = model;

    await player.stop();
    await player.setAsset(model.audioPath);
    await player.setLoopMode(LoopMode.one);
    await player.play();

    final totalSeconds = _parseDuration(model.time);

    emit(
      PlayerState(
        sessionActive: true,
        sessionDuration: Duration(seconds: totalSeconds),
      ),
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final next = state.elapsed + const Duration(seconds: 1);

      if (next >= state.sessionDuration) {
        _timer?.cancel();
        player.pause();
        emit(
          state.copyWith(
            elapsed: state.sessionDuration,
            sessionActive: false,
            sessionExpired: true,
          ),
        );
      } else {
        emit(state.copyWith(elapsed: next));
      }
    });
  }

  Future<void> stopSession() async {
    _timer?.cancel();
    await player.pause();
    currentModel = null;
    emit(const PlayerState());
  }

  void togglePlayPause() => player.playing ? player.pause() : player.play();

  void seek(Duration position) {
    final clamped = position < Duration.zero
        ? Duration.zero
        : (position > state.sessionDuration ? state.sessionDuration : position);

    emit(state.copyWith(elapsed: clamped));
  }

  void clearExpired() => emit(state.copyWith(sessionExpired: false));

  int _parseDuration(String time) {
    final colon = RegExp(r'^(\d+):(\d+)$').firstMatch(time.trim());
    if (colon != null) {
      return int.parse(colon.group(1)!) * 60 + int.parse(colon.group(2)!);
    }
    final mins = RegExp(r'(\d+)').firstMatch(time.trim());
    if (mins != null) return int.parse(mins.group(1)!) * 60;
    return 180;
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    player.dispose();
    return super.close();
  }
}
