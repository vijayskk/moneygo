// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moneygo/db/transactions/transactions_db_fns.dart';
import 'package:moneygo/models/categories/category_model.dart';
import 'package:moneygo/models/transactions/transactions_model.dart';

class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController nameCtr = TextEditingController();
    TextEditingController amoundCtr = TextEditingController();
    TextEditingController categoryCtr = TextEditingController();


    return Scaffold(
      body: Container(
        child: Column(
          children: [

            SafeArea(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Add Transaction",
                        textScaleFactor: 2,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: nameCtr,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Transaction Name'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: amoundCtr,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Amound'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Dropdown'),
                      ),
                    ),
                    ElevatedButton.icon(
                        onPressed: ()async {
                          await TransactionDB().addTransaction(TransactionModel(name: nameCtr.text, amound: int.parse(amoundCtr.text).toDouble(), category: CategoryModel(name: 'dummy category', type: CategoryType.expense), type: CategoryType.expense, date: DateTime.now()));
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.add),
                        label: Text('Add'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
