import 'package:flutter/material.dart';

class CaloriesDetailPage extends StatelessWidget {
  const CaloriesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calories Details'),
      ),
      body: Center(
        child: Text('Details about calories'),
      ),
    );
  }
}
