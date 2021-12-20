import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneygo/models/categories/category_model.dart';
import 'package:moneygo/screens/categories/screen_categories.dart';

String _dbname = 'cats';

abstract class CategoryDbFns {
  Future<void> insertCategory(CategoryModel value);
  Future<void> getCategories();
  Future<void> deleteCategory(int id);
}

class CategoryDB implements CategoryDbFns {
  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _db = await Hive.openBox<CategoryModel>(_dbname);
    int key = await _db.add(value);
    value.id = key;
    _db.put(key, value);
  }

  @override
  Future<void> getCategories() async {
    final _db = await Hive.openBox<CategoryModel>(_dbname);
    print(_db.values.toList());
    categorieslist.value = _db.values.toList();
    categorieslist.notifyListeners();
  }

  @override
  Future<void> deleteCategory(int id) async {
    final _db = await Hive.openBox<CategoryModel>(_dbname);
    _db.delete(id);
    getCategories();
  }
}
