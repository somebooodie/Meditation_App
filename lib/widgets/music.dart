import 'package:flutter/material.dart';
import 'package:meditation_app/widgets/home_card.dart';

class MusicCard extends StatelessWidget {
  final VoidCallback onTap;

  const MusicCard({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      title: 'Music',
      onTap: onTap,
      icon: Icons.music_note,
      color: Colors.yellow, // Set the color for Music card
    );
  }
}
