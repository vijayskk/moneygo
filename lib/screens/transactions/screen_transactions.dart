import 'package:flutter/material.dart';
import 'package:moneygo/models/transactions/transactions_model.dart';

ValueNotifier<List<TransactionModel>> transactions = ValueNotifier([]);

class ScreenTransactions extends StatelessWidget {
  ScreenTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ValueListenableBuilder(
        valueListenable: transactions,
        builder: (context, List<TransactionModel> trans, child) {
          return ListView.separated(
            itemBuilder: (ctx, index) {
              TransactionModel transaction = trans[index];
              return Card(
                  child: ListTile(
                title: Text(transaction.amound.toString()),
                subtitle: Text(transaction.category.name),
                leading: CircleAvatar(
                  child: Text(
                    "${transaction.date.day}\n${transaction.date.month}",
                    textAlign: TextAlign.center,
                    textScaleFactor: .7,
                  ),
                ),
              ));
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: trans.length,
          );
        },
      ),
    );
  }
}
