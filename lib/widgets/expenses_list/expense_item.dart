import 'package:app_catatan_pengeluaran/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(expense.amountExpense),
                const Spacer(),
                Icon(categoryIcons[expense.category]),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  expense.formattedDate,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
