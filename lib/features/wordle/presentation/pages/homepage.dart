import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/core/utils/extensions.dart';
import 'package:wordle/features/wordle/presentation/view_models/selected_letters_view_model.dart';
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
    var errorMessage = ref.watch(selectLettersProvider).errorMessage;
    var isError = errorMessage != null;
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Center(
          child: SizedBox(
            width: 600,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HeaderWidget(),
                  SizedBox(height: context.height(0.02)),
                  Visibility(
                    visible: isError,
                    child: SizedBox(
                      height: context.height(0.06),
                      width: context.width(0.4),
                      child: Card(
                        child: Center(
                          child: Text(
                            errorMessage ?? '',
                            style: context.textTheme.labelMedium,
                          ),
                        ),
                      ),
                    ),
                    replacement: SizedBox(height: context.height(0.05)),
                  ),
                  SizedBox(height: context.height(0.02)),
                  const GridViewWidget(),
                  const SizedBox(height: 0.15),
                  const KeyboardWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
