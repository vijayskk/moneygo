import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moneygo/db/categories/category_db_fns.dart';
import 'package:moneygo/models/categories/category_model.dart';

ValueNotifier<CategoryType> current = ValueNotifier(CategoryType.income);
TextEditingController _nameCon = TextEditingController();

showpopup(BuildContext context) async {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("Cancel"))
          ],
          title: Text("Add Category"),
          content: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: _nameCon,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter Category"),
                ),
                Row(
                  children: [
                    RadioBTN(value: CategoryType.income, title: "Income"),
                    RadioBTN(value: CategoryType.expense, title: "Expense"),
                  ],
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      if (_nameCon.text.isNotEmpty) {
                        CategoryDB()
                            .insertCategory(CategoryModel(
                                name: _nameCon.text, type: current.value))
                            .then((value) {
                          CategoryDB().getCategories();
                          _nameCon.clear();
                          Navigator.of(ctx).pop();
                        });
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text("Add"))
              ],
            ),
          ),
        );
      });
}

class RadioBTN extends StatelessWidget {
  final CategoryType value;
  final String title;
  const RadioBTN({Key? key, required this.value, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: current,
            builder: (_, CategoryType v, __) {
              return Radio<CategoryType>(
                value: value,
                groupValue: v,
                onChanged: (e) {
                  if (e == null) {
                    return;
                  }
                  current.value = e;
                },
              );
            }),
        Text(title)
      ],
    );
  }
}
