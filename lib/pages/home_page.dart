import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/pages/profile_page.dart';
import 'package:meditation_app/widgets/meditation.dart';
import 'package:meditation_app/widgets/music.dart';
import 'package:meditation_app/widgets/tips.dart';
import 'package:meditation_app/widgets/yoga.dart';

class HomePage extends StatelessWidget {
  // Placeholder currentUser with default values
  final User currentUser = User(
    userName: 'Default User',
    password: 'password', // Dummy password for placeholder
    image: 'path/to/default/image.jpg', // Path to a default image or asset
    finishedExercises: 0,
    userEmail: 'user@example.com',
  );

  HomePage(
    User user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    userName: currentUser.userName,
                    image: currentUser.image ?? 'defaultImagePath',
                    finishedExercises: currentUser.finishedExercises ?? 0,
                    userEmail: currentUser.userEmail ?? '',
                    //userEmail: currentUser.userEmail,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
          TipsCard(
            tip: Tip(
              id: 1,
              text: 'This is a tip.',
              author: 'John Doe',
              upvotes: [],
              downvotes: [],
            ),
            onTap: () {
              // Handle Tips card tap
              print('Tips card tapped');
            },
          ),
          YogaVideosCard(
            onTap: () {
              // Handle Yoga Videos card tap
              print('Yoga Videos card tapped');
            },
          ),
          MusicCard(
            onTap: () {
              // Handle Music card tap
              print('Music card tapped');
            },
          ),
          MeditationCard(), // Use MeditationCard widget, which provides its own color
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  CustomSearchDelegate() {}
}
