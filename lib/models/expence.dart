import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';


final uuid = const Uuid().v4();

final famattedDate = DateFormat.yMd();

enum Category { food, travel, leasure, work }

class ExpenceModel {
  ExpenceModel(
      {required this.amount,
      required this.date,
      required this.title,
      required this.category})
      : id = uuid;

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
