import 'package:hive/hive.dart';

part 'expense.g.dart';

const int ExpenseHiveID = 0;

@HiveType(typeId: ExpenseHiveID)
class Expense extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String amount;

  @HiveField(2)
  String category;

  @HiveField(3)
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
