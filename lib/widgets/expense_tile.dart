import 'package:flutter/material.dart';
import 'package:flutter_study2/models/expence.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({super.key, required this.expense});

  final ExpenceModel expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            Text(
              expense.title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                Text(
                  expense.amount.toStringAsFixed(2),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.adb_sharp),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      expense.date.toString(),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
