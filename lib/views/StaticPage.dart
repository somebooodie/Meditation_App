import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/user.dart';

class MyStaticPage extends StatelessWidget {
  final User? currentUser;

  const MyStaticPage({Key? key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meditation App"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => context.goNamed("signin"),
                child: const Text("Sign In"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.goNamed("signup"),
                child: const Text("Sign Up"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
