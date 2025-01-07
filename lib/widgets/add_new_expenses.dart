import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/expence.dart'; // Assuming the enum is defined here

class AddNewExpenses extends StatefulWidget {
  const AddNewExpenses({super.key});

  @override
  State<AddNewExpenses> createState() => _AddNewExpensesState();
}

class _AddNewExpensesState extends State<AddNewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            hintText: "Email",
            label: Text("Email"),
          ),
          keyboardType: TextInputType.text,
          maxLength: 50,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                  hintText: "Amount",
                  label: Text("Amount"),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Expanded(
              child: Row(
                children: [Text("data")],
              ),
            )
          ],
        ),
        Row(
          children: [
            DropdownButton(
              items: Category.values
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
            ),
          ],
        )
      ],
    );
  }
}
