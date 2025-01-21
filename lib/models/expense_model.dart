import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();
final formatterAmount = NumberFormat.currency(symbol: 'Rp. ');
enum Category {food, shopping, entertainment, household, transportation, health}
const categoryIcons = {
  Category.food: Icons.dining,
  Category.shopping: Icons.shopping_bag,
  Category.entertainment: Icons.shop,
  Category.household: Icons.house,
  Category.transportation: Icons.emoji_transportation,
  Category.health: Icons.health_and_safety,
};
final formatterDate = DateFormat('dd/MM/yy');

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : Id = uuid.v4(); // ini namanya Initializer List

  final String Id;
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
