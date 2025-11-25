import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  void addExpense() {}
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  String expenseTitle = '';
  double amount = 0;
  Category _selectedCategory = Category.leisure;
  void _saveExpenseTitle(String input) {
    expenseTitle = input;
  }

  void _submitExpenseForm() {
    var enteredAmount = double.tryParse(_amountController.text);
    var amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text(
            'Please make sure you enter a valid title, amount, and date',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Close'),
            ),
          ],
        ),
      );
      return;
    }
    // continue your code here
  }

  void _showDatePicker() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1, now.month, now.day);
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  onChanged: _saveExpenseTitle,

                  decoration: InputDecoration(
                    label: Text("amount"),
                    prefixText: "\$",
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected'
                          : DateFormat.yMd().format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: () {
                        _showDatePicker();
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  _submitExpenseForm();
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
