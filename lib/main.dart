import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle/core/theme/custom_theme.dart';
import 'package:wordle/dependency_injection.dart';
import 'package:wordle/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize dependency injection
  await init(Environment.prod);
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'Wordle',
      theme: theme,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
