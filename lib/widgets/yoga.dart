import 'package:flutter/material.dart';
import 'package:meditation_app/widgets/home_card.dart';

class YogaVideosCard extends StatelessWidget {
  final VoidCallback onTap;

  const YogaVideosCard({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      title: 'Yoga Videos',
      onTap: onTap,
      icon: Icons.video_library,
      color: Colors.green, // Set the color for Yoga Videos card
    );
  }
}
