import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneygo/models/transactions/transactions_model.dart';
import 'package:moneygo/screens/transactions/screen_transactions.dart';

String _dbname = 'cats';

abstract class TransactionsDBFns {
  Future<void> addTransaction(TransactionModel transaction);
  Future<void> getTransactions();
  Future<void> editTransactions(int id, TransactionModel newtransaction);
  Future<void> deleteTransaction(int id, TransactionModel transaction);
}

class TransactionDB implements TransactionsDBFns {
  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    final _db = await Hive.openBox<TransactionModel>(_dbname);
    int key = await _db.add(transaction);
    transaction.id = key;
    _db.put(key, transaction);
    getTransactions();
  }

  @override
  Future<void> getTransactions() async {
    final _db = await Hive.openBox<TransactionModel>(_dbname);
    print(_db.values.toList());
    transactions.value = _db.values.toList();
    transactions.notifyListeners();
  }

  @override
  Future<void> editTransactions(int id, TransactionModel newtransaction) async {
    // TODO: implement editTransactions
    final _db = await Hive.openBox<TransactionModel>(_dbname);
    _db.put(id, newtransaction);
    getTransactions();
  }

  @override
  Future<void> deleteTransaction(int id, TransactionModel transaction) async {
    // TODO: implement deleteTransaction
    final _db = await Hive.openBox<TransactionModel>(_dbname);
    transaction.isDeleted = true;
    _db.put(id, transaction);
    getTransactions();
  }
}
