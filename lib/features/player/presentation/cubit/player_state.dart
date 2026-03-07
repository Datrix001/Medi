part of 'player_cubit.dart';

class PlayerState {
  final bool sessionActive;
  final bool sessionExpired;
  final Duration elapsed;
  final Duration sessionDuration;

  const PlayerState({
    this.sessionActive = false,
    this.sessionExpired = false,
    this.elapsed = Duration.zero,
    this.sessionDuration = Duration.zero,
  });

  PlayerState copyWith({
    bool? sessionActive,
    bool? sessionExpired,
    Duration? elapsed,
    Duration? sessionDuration,
  }) {
    return PlayerState(
      sessionActive: sessionActive ?? this.sessionActive,
      sessionExpired: sessionExpired ?? this.sessionExpired,
      elapsed: elapsed ?? this.elapsed,
      sessionDuration: sessionDuration ?? this.sessionDuration,
    );
  }

  double get progress {
    if (sessionDuration.inSeconds == 0) return 0;
    return (elapsed.inSeconds / sessionDuration.inSeconds).clamp(0.0, 1.0);
  }

  String get elapsedLabel => _format(elapsed);
  String get durationLabel => _format(sessionDuration);

  String _format(Duration d) {
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    return '$m:${s.toString().padLeft(2, '0')}';
  }
}
