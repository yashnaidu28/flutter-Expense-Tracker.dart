import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
        amount: 399,
        date: DateTime.now(),
        title: 'flutter coures',
        category: Category.work),
    Expense(
        amount: 299,
        date: DateTime.now(),
        title: 'pertol',
        category: Category.travel),
    Expense(
        amount: 199,
        date: DateTime.now(),
        title: 'Medical',
        category: Category.leisure),
    Expense(
        amount: 99,
        date: DateTime.now(),
        title: 'Apple',
        category: Category.food)
  ];
  void _addExpenseOverly() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(
      () {
        _registeredExpense.add(expense);
      },
    );
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(
      () {
        _registeredExpense.remove(expense);
      },
    );
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // to remove exesisting massages on screen immedietly
    ScaffoldMessenger.of(context).showSnackBar(
      // to add a pop up button
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Deleted expenses'),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(
              () {
                _registeredExpense.insert(expenseIndex, expense);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context)
        .size
        .width; // to adjust according to the width or mode of phone

    Widget mainContent = const Center(
      child: Text('No expense found, Build one!'),
    );
    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpense,
        onremovedExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          // it is use to add + icon into the app
          IconButton(onPressed: _addExpenseOverly, icon: const Icon(Icons.add)),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpense),
                Expanded(child: mainContent)
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpense),
                ),
                Expanded(child: mainContent)
              ],
            ),
    );
  }
}
