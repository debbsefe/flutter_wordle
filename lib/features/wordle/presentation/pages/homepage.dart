import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/features/wordle/presentation/view_models/word_today_view_model.dart';
import 'package:wordle/features/wordle/presentation/widgets/grid_view_widget.dart';
import 'package:wordle/features/wordle/presentation/widgets/header_widget.dart';
import 'package:wordle/features/wordle/presentation/widgets/keyboard_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(wordForTodayProvider.notifier).fetchWordForToday();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Center(
          child: SizedBox(
            width: 600,
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  HeaderWidget(),
                  SizedBox(height: 50),
                  GridViewWidget(),
                  SizedBox(height: 50),
                  KeyboardWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
