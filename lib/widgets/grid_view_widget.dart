import 'package:flutter/material.dart';

final gridList = List.generate(30, (index) => index);

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 350,
      child: GridView.count(
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
        crossAxisCount: 5,
        children: gridList
            .map((e) => Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade800)),
                child: const Text('')))
            .toList(),
      ),
    );
  }
}
