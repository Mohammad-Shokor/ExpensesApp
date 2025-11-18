import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Expense {
  Expense({
    required this.category,
    required this.date,
    required this.title,
    required this.amount,
  });
  final String id = Uuid().v4();
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formattedDate {
    return DateFormat.yMd().format(date);
  }
}

enum Category { food, work, leisure, travel }
