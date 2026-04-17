//uuid
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum ExpenseCategory { food, travel, leisure, work }

const categoryIcons = {
  ExpenseCategory.food: Icons.lunch_dining,
  ExpenseCategory.travel: Icons.travel_explore,
  ExpenseCategory.leisure: Icons.movie,
  ExpenseCategory.work: Icons.work,
};

class ExpenseModel {
  // id,title,date,amount
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final ExpenseCategory category;

  ExpenseModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate {
    return DateFormat("dd-MM-yyyy").format(date);
  }
}
