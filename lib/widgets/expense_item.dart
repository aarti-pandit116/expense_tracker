import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [Text(expense.title)],
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text("₹${expense.amount.toStringAsFixed(2)}"),
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  Text(expense.formattedDate),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
