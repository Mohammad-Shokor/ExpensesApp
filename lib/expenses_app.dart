import 'package:expenses_tracker/models/new_expense.dart';
import 'package:expenses_tracker/widgets/expenseslist.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';

class ExpensesApp extends StatefulWidget {
  const ExpensesApp({super.key});

  @override
  State<ExpensesApp> createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  final List<Expense> _registeredExpensesList = [
    Expense(
      amount: 5,
      date: DateTime(2025, 10, 10),
      title: "burger",
      category: Category.food,
    ),
    Expense(
      category: Category.leisure,
      date: DateTime.now(),
      title: "going to the mall",
      amount: 5000,
    ),
    Expense(
      category: Category.work,
      date: DateTime(2001, 9, 11),
      title: "pilot",
      amount: 300,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: () {
              _openAddExpenseOverlay();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Expenseslist(expensesList: _registeredExpensesList),
    );
  }
}
