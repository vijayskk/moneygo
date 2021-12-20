import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneygo/models/categories/category_model.dart';
part 'transactions_model.g.dart';

@HiveType(typeId: 2)
class TransactionModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  final double amound;

  @HiveField(3)
  final CategoryModel category;

  @HiveField(4)
  bool isDeleted;

  @HiveField(5)
  final CategoryType type;

  @HiveField(6)
  final DateTime date;

  TransactionModel(
      {this.id,
      required this.name,
      required this.amound,
      required this.category,
      this.isDeleted = false,
      required this.type,
      required this.date});
}
