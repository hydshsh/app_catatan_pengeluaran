import 'package:app_catatan_pengeluaran/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    String formatNumber =
        NumberFormat.currency(symbol: 'Rp. ', decimalDigits: 2)
            .format(expense.amount);

    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(formatNumber),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.gamepad_rounded),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            expense.category.toString(),
                          ),
                        ],
                      ),
                      Text(
                        expense.date.toString(),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
