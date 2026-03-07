import 'package:go_router/go_router.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';
import 'package:medi_app/features/ambience/presentation/screens/ambience_details_screen.dart';
import 'package:medi_app/features/ambience/presentation/screens/ambience_screen.dart';
import 'package:medi_app/features/journal/presentation/screens/journal_screen.dart';
import 'package:medi_app/features/journal/presentation/screens/reflection_screen.dart';

class AppNavigator {
  static final goRouter = GoRouter(
    initialLocation: AmbienceScreen.routeName,
    routes: [
      GoRoute(
        path: AmbienceScreen.routeName,
        builder: (context, state) => AmbienceScreen(),
      ),
      GoRoute(
        path: JournalScreen.routeName,
        builder: (context, state) => JournalScreen(),
      ),
      GoRoute(
        path: AmbienceDetailsScreen.routeName,
        builder: (context, state) {
          final ambienceModel = state.extra as AmbienceModel;
          return AmbienceDetailsScreen(model: ambienceModel);
        },
      ),
      GoRoute(
        path: ReflectionScreen.routeName,
        builder: (context, state) => ReflectionScreen(),
      ),
    ],
  );
}
