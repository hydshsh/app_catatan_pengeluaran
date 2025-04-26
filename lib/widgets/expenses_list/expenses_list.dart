import 'package:app_catatan_pengeluaran/models/expense_model.dart';
import 'package:app_catatan_pengeluaran/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemovedExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemovedExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(
          expenses[index],
        ),
        onDismissed: (direction) {
          onRemovedExpense(expenses[index]);
        },
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
            // horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            // vertical: Theme.of(context).cardTheme.margin!.vertical,
          ),
        ),
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
