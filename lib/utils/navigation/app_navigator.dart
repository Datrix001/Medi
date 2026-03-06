import 'package:go_router/go_router.dart';
import 'package:medi_app/features/ambience/presentation/screens/ambience_screen.dart';
import 'package:medi_app/features/journal/presentation/screens/journal_screen.dart';

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
    ],
  );
}
