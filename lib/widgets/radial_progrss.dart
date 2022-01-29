// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables
import 'package:diet_app_ui/widgets/radial_painter.dart';
import 'package:flutter/material.dart';

class RadialProgress extends StatelessWidget {
  final height;
  final width;
  const RadialProgress({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadialPainter(progress: 0.7),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '1723',
                  style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF200087),
                  ),
                ),
                TextSpan(text: '\n'),
                TextSpan(
                  text: 'kcal left',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF200087),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
