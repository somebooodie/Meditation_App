import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/providrors/AuthProvider.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Sign In"),
            TextField(
              decoration: const InputDecoration(hintText: 'Username'),
              controller: usernameController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              controller: passwordController,
              obscureText: true,
            ),
          ElevatedButton(
  onPressed: () {
    context
        .read<AuthProvider>()
        .signin(
          user: User(
            username: usernameController.text,
            password: passwordController.text,
          ),
        )
        .then((token) {
      if (token.isNotEmpty) {
        // Check if the token is not empty
        context..to('home'); // Corrected method name
      } else {
        // Handle the case when the token is empty or invalid
        // You can show an error message or take appropriate action.
      }
    });
  },
  child: const Text("Sign In"),
)

              child: const Text("Sign In"),
            )
          ],
        ),
      ),
    );
  }
}
