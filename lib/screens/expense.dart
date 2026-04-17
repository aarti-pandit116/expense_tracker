import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<ExpenseModel> _registeredExpenses = [];
  // final List<ExpenseModel> _registeredExpenses = [
  //   ExpenseModel(
  //     title: "Flutter Course",
  //     amount: 699,
  //     date: DateTime.now(),
  //     category: ExpenseCategory.work,
  //   ),
  //   ExpenseModel(
  //     title: "Cinema",
  //     amount: 150,
  //     date: DateTime.now(),
  //     category: ExpenseCategory.leisure,
  //   ),
  //   ExpenseModel(
  //     title: "Food",
  //     amount: 210,
  //     date: DateTime.now(),
  //     category: ExpenseCategory.food,
  //   ),
  // ];

  void _showOpenAddOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewExpense(addExpense: addExpense);
      },
    );
  }

  void addExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(ExpenseModel expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense removed"),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        "No expenses found. Start adding some!",
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredExpenses,
        removeExpense: removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () => _showOpenAddOverlay(),
            icon: Icon(Icons.add, color: Colors.white, size: 24),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: .center,
        children: [
          if (_registeredExpenses.isNotEmpty)
            Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
