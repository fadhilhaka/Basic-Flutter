import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cashflow_tracker/screen/transaction_screen.dart';
import 'package:cashflow_tracker/model/expense.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CashflowList();
  }
}

class CashflowList extends StatefulWidget {
  @override
  _CashflowListState createState() => _CashflowListState();
}

class _CashflowListState extends State<CashflowList> {
  List<Expense> expenseList = transactionList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cashflow'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          String date = 'Date: ${expenseList[index].date}';
          String category = 'Category: ${expenseList[index].category}';
          String amount = 'RP ${expenseList[index].amount}';
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(category),
                  SizedBox(height: 8.0),
                  Text(amount),
                ],
              ),
            ),
          );
        },
        itemCount: expenseList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransactionScreen();
          })).then((newExpense) {
            setState(() {
              expenseList.add(newExpense);
            });
          });
        },
        tooltip: 'Add new expense',
        child: Icon(Icons.add),
      ),
    );
  }
}
