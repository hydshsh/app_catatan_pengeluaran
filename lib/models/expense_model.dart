import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatterAmount = NumberFormat.currency(symbol: 'Rp. ');
enum Category {Food, Shopping, Entertainment, Household, Transportation, Health}
const categoryIcons = {
  Category.Food: Icons.dining,
  Category.Shopping: Icons.shopping_bag,
  Category.Entertainment: Icons.shop,
  Category.Household: Icons.house,
  Category.Transportation: Icons.emoji_transportation,
  Category.Health: Icons.health_and_safety,
};
final formatterDate = DateFormat('dd/MM/yy');

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // ini namanya Initializer List

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatterDate.format(date);
  }

  String get amountExpense {
    return formatterAmount.format(amount);
  }
}
