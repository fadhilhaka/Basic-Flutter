import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cashflow_tracker/model/expense.dart';

final GlobalKey<FormState> amountFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();

class TransactionScreen extends StatelessWidget {
  bool amountIsValidated = false;
  bool categoryIsValidated = false;

  @override
  Widget build(BuildContext context) {
    resetCurrentValue();
    return Scaffold(
      appBar: AppBar(
        leading: FittedBox(
          fit: BoxFit.cover,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text('New Transaction'),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
            onPressed: () {
              amountIsValidated = amountFormKey.currentState!.validate();
              categoryIsValidated = categoryFormKey.currentState!.validate();
              if (amountIsValidated && categoryIsValidated) {
                final expense = new Expense(
                  id: currentId,
                  amount: inputedAmount,
                  category: inputedCategory,
                  date: inputedDate,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('New transaction is saved.'),
                    duration: Duration(seconds: 2),
                  ),
                );
                print('Tes1 ${inputedAmount}, ${inputedCategory}');
                Navigator.pop(context, expense);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          TransactionForm(),
        ],
      ),
    );
  }
}

class TransactionForm extends StatefulWidget {
  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  var txt = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String formattedDate =
      DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(selectedDate);
        txt.text = formattedDate;
        inputedDate = formattedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    txt.text = formattedDate;
    inputedDate = formattedDate;
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      child: Column(
        children: <Widget>[
          Form(
            key: amountFormKey,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              validator: (value) {
                inputedAmount = value ?? '0';
                if (value == null || value.isEmpty) {
                  return 'Please enter transaction amount.';
                }
                return null;
              },
            ),
          ),
          Form(
            key: categoryFormKey,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Category'),
              keyboardType: TextInputType.number,
              validator: (value) {
                inputedCategory = value ?? 'Other';
                if (value == null || value.isEmpty) {
                  return 'Please enter transaction category.';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 8.0),
          Form(
            child: TextFormField(
              controller: txt,
              enableInteractiveSelection: false,
              showCursor: false,
              readOnly: true,
              onTap: () {
                _selectDate(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
