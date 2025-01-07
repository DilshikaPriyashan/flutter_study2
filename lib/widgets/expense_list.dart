import 'package:flutter/material.dart';
import 'package:flutter_study2/models/expence.dart';
import 'package:flutter_study2/widgets/expense_tile.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenceList});

  final List<ExpenceModel> expenceList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenceList.length,
        itemBuilder: (context, index) {
          return ExpenseTile(
            expense: expenceList[index],
          );
        },
      ),
    );
  }
}
