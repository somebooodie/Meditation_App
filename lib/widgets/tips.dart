import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/widgets/home_card.dart';

class TipsCard extends StatelessWidget {
  final Tip tip;
  final VoidCallback onTap;

  const TipsCard({
    required this.tip,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      title: 'Tips',
      onTap: onTap,
      icon: Icons.lightbulb_outline,
      color: Colors.blue, // Set the color for Tips card
    );
  }
}
