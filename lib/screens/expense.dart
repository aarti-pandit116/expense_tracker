import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
      title: "Flutter Course",
      amount: 699,
      date: DateTime.now(),
      category: ExpenseCategory.work,
    ),
    ExpenseModel(
      title: "Cinema",
      amount: 150,
      date: DateTime.now(),
      category: ExpenseCategory.leisure,
    ),
    ExpenseModel(
      title: "Food",
      amount: 210,
      date: DateTime.now(),
      category: ExpenseCategory.food,
    ),
  ];

  void _showOpenAddOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: () => _showOpenAddOverlay(),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: .center,
        children: [
          Text("Chart"),
          Expanded(child: ExpenseList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
