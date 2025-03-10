import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final String title;

  const AppLogo({Key? key, this.title = 'Speako'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.chat_bubble, color: Colors.white),
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
