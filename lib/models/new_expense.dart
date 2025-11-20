import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  String expenseTitle = '';
  double amount = 0;
  void _saveExpenseTitle(String input) {
    expenseTitle = input;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            onChanged: _saveExpenseTitle,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Expense Title")),
          ),
          TextField(
            controller: _amountController,
            onChanged: _saveExpenseTitle,

            decoration: InputDecoration(
              label: Text("amount"),
              prefixText: "\$",
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  print(expenseTitle);
                },
                child: Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
