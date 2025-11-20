import 'package:flutter/material.dart';
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

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

enum Category { food, work, leisure, travel }
