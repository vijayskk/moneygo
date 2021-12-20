import 'package:moneygo/models/categories/category_model.dart';

List<CategoryModel> makeList(CategoryType type, List<CategoryModel> data) {
  List<CategoryModel> res = [];
  for (var i = 0; i < data.length; i++) {
    CategoryModel e = data[i];
    if (e.type == type && e.isDeleted == false) {
      res = [...res, e];
    }
  }
  return res;
}
