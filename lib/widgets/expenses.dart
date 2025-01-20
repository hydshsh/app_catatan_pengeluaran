import 'package:app_catatan_pengeluaran/widgets/expenses_list/expenses_list.dart';
import 'package:app_catatan_pengeluaran/models/expense_model.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Beli EAFC 25 Steam',
        amount: 95000,
        date: DateTime.now(),
        category: Category.entertainment),
    Expense(
        title: 'Grab Tomoro Coffee',
        amount: 25000,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Beli Benoson-N',
        amount: 40000,
        date: DateTime.now(),
        category: Category.health),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 90, 216, 96),),
      body: Column(
        children: [
          Text('The Chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
