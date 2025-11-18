import 'package:expenses_tracker/widgets/expenses_item.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenseslist extends StatelessWidget {
  const Expenseslist({super.key, required this.expensesList});
  final List<Expense> expensesList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ExpensesItem(expense: expensesList[index]);
      },
      itemCount: expensesList.length,
    );
  }
}
