import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum Category {food, shopping, entertainment, household, transportation, health}

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
}
