import 'package:flutter/material.dart';
import 'package:wordle/widgets/grid_view_widget.dart';
import 'package:wordle/widgets/header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Center(
          child: SizedBox(
            width: 600,
            child: Column(
              children: const [
                HeaderWidget(),
                SizedBox(height: 50),
                GridViewWidget(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
