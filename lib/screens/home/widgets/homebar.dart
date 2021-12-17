import 'package:flutter/material.dart';
import 'package:moneygo/screens/home/screen_home.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndex,
      builder: (BuildContext ctx, int current, _) {
        return BottomNavigationBar(
          currentIndex: current,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
          ],
          onTap: (value) {
            ScreenHome.selectedIndex.value = value;
          },
        );
      },
    );
  }
}
