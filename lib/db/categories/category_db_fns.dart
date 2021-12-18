import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneygo/models/categories/category_model.dart';

abstract class CategoryDbFns {
  Future<void> insertCategory(CategoryModel value);
  Future<List<CategoryModel>> getCategories();
  Future<void> deleteCategory(String id);
}

class CategoryDB implements CategoryDbFns {
  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _db = await Hive.openBox<CategoryModel>('categories');
    _db.add(value);
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final _db = await Hive.openBox<CategoryModel>('categories');
    print(_db.values.toList());
    return _db.values.toList();
  }

  @override
  Future<void> deleteCategory(String id) async {
    final _db = await Hive.openBox<CategoryModel>('categories');
    _db.delete(id);
  }
}
