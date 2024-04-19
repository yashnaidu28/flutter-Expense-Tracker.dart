
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{
   const ExpensesList ({
    super.key,
  required this.expenses,
  required this.onremovedExpense,
  }
  );
  final List<Expense>expenses;
  final void Function(Expense expense) onremovedExpense;

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
    itemCount: expenses.length, 
    itemBuilder: (ctx,index)=>Dismissible(// Dismissible is use to slide or wipe the added expenses
      key:ValueKey(expenses[index]),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
      ),
      onDismissed: (direction){
onremovedExpense(expenses[index]);
      },
       child: ExpenseItem(
        expenses[index],
        ),
        ) , 
    );// we use listview instid of column to get scoralable view
  }
}