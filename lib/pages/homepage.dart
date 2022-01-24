import 'package:flutter/material.dart';
import 'package:wordle/widgets/header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: const [
          HeaderWidget(),
        ],
      ),
    ));
  }
}
