import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_catatan_pengeluaran/models/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key,
    required this.onAddExpense,
  });

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;

  void _openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(
      now.year - 1,
      now.month,
      now.day,
    );
    final datePicked = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = datePicked;
    });
  }

  void _submitExpenseData() {
    List<String> notEntered = [];
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty) {
      notEntered.add('judul');
    }
    if (amountIsInvalid) {
      notEntered.add('jumlah');
    }
    if (_selectedDate == null) {
      notEntered.add('tanggal');
    }
    if (_selectedCategory == null) {
      notEntered.add('kategori');
    }
    if (notEntered.isEmpty) {
      widget.onAddExpense(
        Expense(
            title: _titleController.text,
            amount: enteredAmount!,
            date: _selectedDate!,
            category: _selectedCategory!),
      );
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Peringatan'),
          content: Text(
              'Pada bagian ${notEntered.join(', ')} belum diisi, silahkan untuk diisi terlebih dahulu'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Oke'))
          ],
        ),
      );
    }
    // if (_titleController.text.trim().isEmpty) {
    //   showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //       title: Text('Peringatan'),
    //       content: Text('Anda belum memasukkan judul pengeluaran'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(ctx);
    //           },
    //           child: Text('Oke'),
    //         )
    //       ],
    //     ),
    //   );
    // }
    // if (amountIsInvalid) {
    //   showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //       title: Text('Peringatan'),
    //       content: Text('Anda belum memasukkan jumlah pengeluaran'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(ctx);
    //           },
    //           child: Text('Oke'),
    //         )
    //       ],
    //     ),
    //   );
    // }
    // if (_selectedDate == null) {
    //   showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //       title: Text('Peringatan'),
    //       content: Text('Anda belum memilih tanggal pengeluaran'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(ctx);
    //           },
    //           child: Text('Oke'),
    //         )
    //       ],
    //     ),
    //   );
    // }
    // if (_selectedCategory == null) {
    //   showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //       title: Text('Peringatan'),
    //       content: Text('Anda belum memilih kategori pengeluaran'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(ctx);
    //           },
    //           child: Text('Oke'),
    //         )
    //       ],
    //     ),
    //   );
    // }

    // if (_titleController.text.isEmpty ||
    //     amountIsInvalid ||
    //     _selectedDate == null ||
    //     _selectedCategory == null) {
    //   showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //       title: Text('Peringatan'),
    //       content:
    //           Text('Pastikan kamu sudah memasukkan semua datanya dengan benar'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(ctx);
    //           },
    //           child: Text('Oke'),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 120,
            decoration: const InputDecoration(
              label: Text('Judul Pengeluaran'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text('Rp. '),
                    label: Text('Jumlah Pengeluaran'),
                    hintText: '(misal 5000)',
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: _openDatePicker,
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'Belum Pilih Tanggal'
                            : DateFormat('dd/MM/yy').format(_selectedDate!),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                hint: const Text('Pilih Kategori'),
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                  print(value);
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Batal'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitExpenseData,
                // () {
                //   print(_titleController.text);
                //   print(_amountController.text);
                // },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
