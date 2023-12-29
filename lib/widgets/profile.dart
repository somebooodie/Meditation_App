import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName;
  final String userEmail;

  const ProfilePage({
    required this.userName,
    required this.userEmail,
    Key? key,
    required int finishedExercises,
    required String image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('User Name: $userName'),
          SizedBox(height: 16),
          Text('User Email: $userEmail'),
          // Add more details as needed
        ],
      ),
    );
  }
}
