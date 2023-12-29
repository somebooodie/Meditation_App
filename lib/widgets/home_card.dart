import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? color;

  const HomeCard({
    this.title,
    required this.onTap,
    this.icon,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: 50,
                  color: color,
                ),
              if (title != null)
                Text(
                  title!,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
