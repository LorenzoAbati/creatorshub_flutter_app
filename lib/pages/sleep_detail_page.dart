import 'package:flutter/material.dart';

class SleepDetailPage extends StatelessWidget {
  const SleepDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Details'),
      ),
      body: Center(
        child: Text('Details about sleep'),
      ),
    );
  }
}