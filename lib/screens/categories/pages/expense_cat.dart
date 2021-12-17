import 'package:flutter/material.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.separated(
        itemBuilder: (ctx, index) {
          return Card(
              child: ListTile(
            title: Text("Expense $index"),
            subtitle: const Text("Currently : 20000"),
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          ));
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 12,
      ),
    );
  }
}
