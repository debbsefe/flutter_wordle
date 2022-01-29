import 'package:go_router/go_router.dart';

import 'features/wordle/presentation/pages/homepage.dart';
import 'features/wordle/presentation/pages/settings_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
