import 'package:flutter/material.dart';

class IllustrationContainer extends StatelessWidget {
  final String imagePath;
  final double height;

  const IllustrationContainer({
    Key? key,
    required this.imagePath,
    this.height = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.minPositive,
          height: height + 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Image.asset(imagePath, height: height),
      ],
    );
  }
}
