import 'package:flutter/material.dart';
import 'package:speako/widgets/custom_header.dart';
import 'package:speako/widgets/custom_button.dart';
import 'package:speako/widgets/app_logo.dart';
import 'package:speako/widgets/illustration_container.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogo(),
                    SizedBox(height: 30),
                    IllustrationContainer(
                      imagePath: 'assets/start_illustration.png',
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Welcome to your first lessons!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Let\'s start studying!',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      text: 'Let\'s Go!',
                      onPressed: () {
                        Navigator.pushNamed(context, '/lesson');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
