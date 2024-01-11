import 'package:flutter/material.dart';
import 'package:meditation_app/widgets/home_card.dart';

class MeditationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeCard(
      title: 'Meditation',
      onTap: () {
        // Handle Meditation card tap
        print('Meditation card tapped');
      },
      icon: Icons.spa,
      color: Colors.amber, // Set the color for Meditation card
    );
  }
}
