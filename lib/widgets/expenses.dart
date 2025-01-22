import 'package:app_catatan_pengeluaran/widgets/add_expense.dart';
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
        category: Category.Entertainment),
    Expense(
        title: 'Grab Tomoro Coffee',
        amount: 25000,
        date: DateTime.now(),
        category: Category.Food),
    Expense(
        title: 'Beli Benoson-N',
        amount: 40000,
        date: DateTime.now(),
        category: Category.Health),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const AddExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Pengeluaran'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExpenseOverlay,
        child: const Icon(Icons.add),
      ),
    );
  }
}
