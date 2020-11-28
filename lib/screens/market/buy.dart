import 'package:flutter/material.dart';

class BuyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Container(
            child: Card(
              color: Colors.blue,
              child: InkWell(
                splashColor: Colors.white,
                onTap: () async {
                  print(index);
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
