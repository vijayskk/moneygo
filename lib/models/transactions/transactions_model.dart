import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneygo/models/categories/category_model.dart';
part 'transactions_model.g.dart';

@HiveType(typeId: 2)
class Transaction {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final double amound;

  @HiveField(2)
  final CategoryModel category;

  @HiveField(3)
  final bool isDeleted;

  @HiveField(4)
  final CategoryType type;

  Transaction(
      {required this.id,
      required this.amound,
      required this.category,
      this.isDeleted = false,
      required this.type});
}
