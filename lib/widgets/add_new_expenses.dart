import 'package:flutter/material.dart';
import '../models/expence.dart';

class AddNewExpenses extends StatefulWidget {
  const AddNewExpenses({super.key});

  @override
  State<AddNewExpenses> createState() => _AddNewExpensesState();
}

class _AddNewExpensesState extends State<AddNewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category? _selectedCategory; // Nullable to handle no initial selection

  final DateTime initialDate = DateTime.now();
  final DateTime firstDate = DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
  final DateTime lastDate = DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);

  DateTime _selectedDate = DateTime.now();

  Future<void> _openDateModal() async {
    try {
      final pickData = await showDatePicker(
          context: context,
          firstDate: firstDate,
          lastDate: lastDate,
          initialDate: initialDate);

      setState(() {
        _selectedDate = pickData!;
      });
    } catch (err) {
      print(err.toString());
    }
  }

  void _handleFormSubmit() {
    final userAmount = double.tryParse(_amountController.text.trim());

    if (_titleController.text.trim().isEmpty ||
        userAmount == null ||
        userAmount <= 0) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Invalid Input"),
            content:
                const Text("Please enter a valid title and a positive amount."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    } else {
      print(
          "Data saved: Title - ${_titleController.text.trim()}, Amount - $userAmount");
    }
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
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: "Title",
              labelText: "Title",
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
                    labelText: "Amount",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(famattedDate.format(_selectedDate)),
                    IconButton(
                        onPressed: _openDateModal,
                        icon: Icon(Icons.date_range_outlined))
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<Category>(
                value: _selectedCategory,
                items: Category.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(
                      category.name[0].toUpperCase() +
                          category.name.substring(1), // Capitalize first letter
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                hint: const Text("Select Category"),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.redAccent),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: _handleFormSubmit,
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blueAccent),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
