import 'package:go_router/go_router.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';
import 'package:medi_app/features/ambience/presentation/screens/ambience_details_screen.dart';
import 'package:medi_app/features/ambience/presentation/screens/ambience_screen.dart';
import 'package:medi_app/features/journal/data/model/journal_model.dart';
import 'package:medi_app/features/journal/presentation/screens/journal_details_screen.dart';
import 'package:medi_app/features/journal/presentation/screens/journal_screen.dart';
import 'package:medi_app/features/journal/presentation/screens/reflection_screen.dart';
import 'package:medi_app/features/player/presentation/screens/player_screen.dart';

class AppNavigator {
  static final goRouter = GoRouter(
    initialLocation: AmbienceScreen.routeName,
    routes: [
      GoRoute(
        path: AmbienceScreen.routeName,
        builder: (context, state) => const AmbienceScreen(),
      ),
      GoRoute(
        path: AmbienceDetailsScreen.routeName,
        builder: (context, state) {
          final model = state.extra as AmbienceModel;
          return AmbienceDetailsScreen(model: model);
        },
      ),
      GoRoute(
        path: PlayerScreen.routeName,
        builder: (context, state) {
          final model = state.extra as AmbienceModel;
          return PlayerScreen(model: model);
        },
      ),
      GoRoute(
        path: ReflectionScreen.routeName,
        builder: (context, state) {
          final model = state.extra as AmbienceModel;
          return ReflectionScreen(model: model);
        },
      ),
      GoRoute(
        path: JournalScreen.routeName,
        builder: (context, state) => const JournalScreen(),
      ),
      // NEW — journal detail
      GoRoute(
        path: JournalDetailScreen.routeName,
        builder: (context, state) {
          final model = state.extra as JournalModel;
          return JournalDetailScreen(model: model);
        },
      ),
    ],
  );
}
