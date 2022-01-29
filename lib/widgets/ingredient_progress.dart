// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress;
  final Color color;
  const IngredientProgress({
    Key? key,
    required this.ingredient,
    required this.leftAmount,
    required this.progress,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 10,
                  width: width * 0.29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: color,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Text('${leftAmount}g left')
          ],
        ),
      ],
    );
  }
}
