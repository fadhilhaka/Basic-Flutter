import 'package:flutter/cupertino.dart';

class Expense {
  int id;
  String amount;
  String category;
  String date;

  Expense({
    required this.id,
    required this.amount,
    required this.category,
    required this.date,
  });
}

int currentId = 0;
String inputedAmount = "";
String inputedCategory = "";
String inputedDate = "";

List<Expense> transactionList = [];

void resetCurrentValue() {
  currentId = transactionList.length + 1;
  inputedAmount = '';
  inputedCategory = '';
  inputedDate = '';
}
