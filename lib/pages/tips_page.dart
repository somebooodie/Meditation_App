// tips_page.dart
import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';

class TipsPage extends StatelessWidget {
  final List<Tip> tips;

  TipsPage({required this.tips});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
      ),
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tips[index].text),
            subtitle: Text('Author: ${tips[index].author}'),
            onTap: () {
              // Handle tap on a tip (navigate to tip details, etc.)
              print('Tip ${tips[index].id} tapped');
            },
          );
        },
      ),
    );
  }
}
