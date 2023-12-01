import 'package:flutter/material.dart';
import 'package:learning0/entities.dart';
import 'calories_detail_page.dart';
import 'sleep_detail_page.dart';
import 'chat.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Activity'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // More button action
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          ActivityCard(
            icon: Icons.local_fire_department,
            title: 'Calories',
            value: '345 Kcal',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CaloriesDetailPage()),
              );
            },
          ),
          ActivityCard(
            icon: Icons.bed,
            title: 'Sleep',
            value: '85 Score',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SleepDetailPage()),
              );
            },
          ),
          ActivityCard(
            icon: Icons.access_time,
            title: 'Another One',
            value: '85 seconds',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatPage()),
              );
            },
          ),
          // ... Repeat for other cards ...
        ],
      ),
    );
  }
}
