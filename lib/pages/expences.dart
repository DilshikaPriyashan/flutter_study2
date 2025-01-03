import 'package:flutter/material.dart';
import 'package:flutter_study2/consts/colors.dart';
import 'package:flutter_study2/models/expence.dart';
import 'package:flutter_study2/widgets/expense_list.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
  //expenceList
  final List<ExpenceModel> _expenceList = [
    ExpenceModel(
      amount: 15.5,
      date: DateTime.now(),
      title: "Badminton",
      category: Category.leasure,
    ),
    ExpenceModel(
      amount: 55,
      date: DateTime.now(),
      title: "Kottu",
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expence Master",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        actions: [
          Container(
            color: iconBackground,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: themeColor,
      ),
      body: Column(
        children: [
          ExpenseList(expenceList: _expenceList),
        ],
      ),
    );
  }
}
