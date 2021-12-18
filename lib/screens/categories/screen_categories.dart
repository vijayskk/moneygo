import 'package:flutter/material.dart';
import 'package:moneygo/db/categories/category_db_fns.dart';
import 'package:moneygo/screens/categories/pages/expense_cat.dart';
import 'package:moneygo/screens/categories/pages/income_cat.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({Key? key}) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    CategoryDB().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(
              text: 'INCOME',
            ),
            Tab(
              text: 'EXPENSE',
            ),
          ],
        ),
        Expanded(
            child: TabBarView(
          controller: tabController,
          children: const [IncomePage(), ExpensePage()],
        ))
      ],
    );
  }
}
