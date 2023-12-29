import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/providrors/AuthProvider.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

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
        title: const Text("Sign up"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.goNamed('home'),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Sign Up"),
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
              onPressed: () async {
                final User user = User(
                    userName: usernameController.text,
                    password: passwordController.text);
                String token =
                    await context.read<AuthProvider>().signup(user: user);
                if (token.isNotEmpty) {
                  // Navigate to the sign-in page after successful sign-up
                  context.goNamed("signin");
                } else {
                  // Show an error dialog if sign-up fails
                  _showErrorDialog();
                }
              },
              child: const Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sign Up Failed"),
          content: const Text("Failed to create an account. Please try again."),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
