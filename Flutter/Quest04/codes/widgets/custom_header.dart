import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const CustomHeader({Key? key, this.showBackButton = true, this.onBackPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBackButton)
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            ),
          Icon(Icons.dark_mode),
        ],
      ),
    );
  }
}
