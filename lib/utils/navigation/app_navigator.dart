import 'package:go_router/go_router.dart';
import 'package:medi_app/features/ambience/screens/ambience_screen.dart';

class AppNavigator {
  static final goRouter = GoRouter(
    initialLocation: AmbienceScreen.routeName,
    routes: [
      GoRoute(
        path: AmbienceScreen.routeName,
        builder: (context, state) => AmbienceScreen(),
      ),
    ],
  );
}
