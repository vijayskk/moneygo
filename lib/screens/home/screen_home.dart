import 'package:flutter/material.dart';
import 'package:moneygo/screens/categories/screen_categories.dart';
import 'package:moneygo/screens/home/widgets/homebar.dart';
import 'package:moneygo/screens/transactions/screen_transactions.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndex = ValueNotifier(0);

  final List _pages = const [ScreenTransactions(), ScreenCategory()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MoneyGo"),
        centerTitle: true,
      ),
      bottomNavigationBar: const HomeBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndex.value == 0) {
            print("Add Trans");
          } else {
            print("Add Cats");
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: selectedIndex,
          builder: (BuildContext ctx, int value, _) {
            return _pages[value];
          },
        ),
      ),
    );
  }
}
