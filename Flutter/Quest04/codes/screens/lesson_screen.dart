import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LessonScreen(), debugShowCheckedModeBanner: false));
}

class LessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Bar
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.local_fire_department, color: Colors.white),
                    SizedBox(width: 5),
                    Text("4", style: TextStyle(color: Colors.white)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.diamond, color: Colors.white),
                    SizedBox(width: 5),
                    Text("957", style: TextStyle(color: Colors.white)),
                  ],
                ),
                Icon(Icons.wb_sunny, color: Colors.white),
              ],
            ),
          ),

          // Scrollable Lesson Path
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  LessonCard(
                    title: "Lesson 27",
                    subtitle: "Describing abstract objects",
                    color: Colors.redAccent,
                    icon: Icons.note,
                  ),
                  TrophyIcon(26, isLocked: true),
                  SizedBox(height: 20),
                  CustomBubble(text: "START!", color: Colors.blue),
                  SizedBox(height: 20),
                  TrophyIcon(25),
                  SizedBox(height: 20),
                  LessonCard(
                    title: "Lesson 26",
                    subtitle: "Forming an infinite verb",
                    color: Colors.green,
                    icon: Icons.note,
                  ),
                  TrophyIcon(25),
                  SizedBox(height: 20),
                  BubbleRow(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Bottom Navigation Bar
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard),
                label: "Leaderboard",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard),
                label: "Challenge",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.star), label: "Premium"),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Account",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;

  const LessonCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(subtitle, style: TextStyle(color: Colors.white70)),
            ],
          ),
          Icon(icon, color: Colors.white),
        ],
      ),
    );
  }
}

class TrophyIcon extends StatelessWidget {
  final int number;
  final bool isLocked;

  const TrophyIcon(this.number, {this.isLocked = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          isLocked ? Icons.lock : Icons.emoji_events,
          size: 60,
          color: isLocked ? Colors.grey : Colors.amber,
        ),
        if (!isLocked)
          Text("$number", style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class CustomBubble extends StatelessWidget {
  final String text;
  final Color color;

  const CustomBubble({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class BubbleRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BubbleIcon(Icons.check, Colors.amber),
        SizedBox(width: 10),
        BubbleIcon(Icons.edit, Colors.amber),
        SizedBox(width: 10),
        BubbleIcon(Icons.mic, Colors.amber),
      ],
    );
  }
}

class BubbleIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const BubbleIcon(this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white),
    );
  }
}
