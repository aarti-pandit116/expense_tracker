import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.error.withValues(alpha: 0.75),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white, size: 32),
          ),
          onDismissed: (direction) {
            removeExpense(expenses[index]);
          },

          child: ExpenseItem(expense: expenses[index]),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 16);
      },
    );
  }
}
