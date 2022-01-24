import 'package:go_router/go_router.dart';
import 'package:wordle/pages/homepage.dart';
import 'package:wordle/pages/settings_page.dart';

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
