import 'package:app_catatan_pengeluaran/widgets/chart/chart.dart';
import 'package:app_catatan_pengeluaran/widgets/new_expense.dart';
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
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Catatan pengeluaran dihapus'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Batalkan',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget expenseContent = const Center(
      child: Text(
        'Belum ada catatan pengeluaran,\nsilahkan mulai mencatat pengeluaran Anda!',
        textAlign: TextAlign.center,
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      expenseContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemovedExpense: _removeExpense,
      );
    }

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
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: expenseContent,
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _openAddExpenseOverlay,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
