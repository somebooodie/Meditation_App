import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_api_app/models/user.dart';
import 'package:todo_api_app/providers/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> signIn(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://coded-meditation.eapi.joincoded.com/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Handle successful response
      var token = jsonDecode(
          response.body)['token']; // Assuming the response contains a token
      context
          .read<AuthProvider>()
          .setToken(token); // Save the token using AuthProvider
      GoRouter.of(context).go("/homepage");
    } else {
      // Handle error response
      print('Failed to sign in');
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  signIn(_usernameController.text, _passwordController.text);
                },
                child: Text('Sign In'),
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go("/");
                },
                child: Text('Make New User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
