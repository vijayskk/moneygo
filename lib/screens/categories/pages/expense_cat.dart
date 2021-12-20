import 'package:flutter/material.dart';
import 'package:moneygo/db/categories/category_db_fns.dart';
import 'package:moneygo/extras/list_seperator_fn.dart';
import 'package:moneygo/models/categories/category_model.dart';

class ExpensePage extends StatelessWidget {
  final List<CategoryModel> data;
  const ExpensePage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> datalist = makeList(CategoryType.expense, data);
    return Visibility(
      visible: datalist.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            CategoryModel element = datalist[index];
            return Card(
                child: ListTile(
              title: Text(element.name),
              trailing: IconButton(
                  onPressed: () {
                    print("test");
                    CategoryDB().deleteCategory(element.id!);
                  },
                  icon: const Icon(Icons.delete)),
            ));
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: datalist.length,
        ),
      ),
    );
  }
}
