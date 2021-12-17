import 'package:flutter/material.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.separated(
        itemBuilder: (ctx, index) {
          return const Card(
              child: ListTile(
            title: Text("100000"),
            subtitle: Text("Income"),
            leading: CircleAvatar(
              child: Text(
                "12\ndec",
                textAlign: TextAlign.center,
                textScaleFactor: .7,
              ),
            ),
          ));
        },
        separatorBuilder: (ctx, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: 12,
      ),
    );
  }
}
