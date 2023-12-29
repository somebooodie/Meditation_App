import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName;
  final String image;
  final int finishedExercises;
  final String? userEmail;

  const ProfilePage({
    required this.userName,
    required this.image,
    required this.finishedExercises,
    this.userEmail,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(height: 16),
            Text(
              userName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Finished Exercises: $finishedExercises'),
            if (userEmail != null) ...[
              SizedBox(height: 8),
              Text('Email: $userEmail'),
            ],
          ],
        ),
      ),
    );
  }
}
