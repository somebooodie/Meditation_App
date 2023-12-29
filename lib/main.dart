import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providrors/AuthProvider.dart';
import 'package:meditation_app/providrors/TodoProvider.dart';
import 'package:meditation_app/views/HomePage.dart';
import 'package:meditation_app/views/signin.dart';
import 'package:meditation_app/views/signup.dart';
import 'package:meditation_app/views/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
  ], child: MyApp()));
}

// ChangeNotifierProvider(
//   create = (context) => TodoProvider(),

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }

  final _router = GoRouter(routes: [
    GoRoute(
      path: "/home",
      name: "home",
      builder: (context, state) => MyHomePage(),
    ),
    // GoRoute(
    //   path: "/addNote",
    //   name: "addNote",
    //   builder: (context, state) => AddNote(),
    // ),
    // GoRoute(
    //   path: "/signup",
    //   name: 'signup',
    //   builder: (context, state) => SignupPage(),
    // ),
    GoRoute(
      path: "/",
      name: 'signup',
      builder: (context, state) => SignupPage(),
    ),
    GoRoute(
      path: "/signin",
      name: "signin",
      builder: (context, state) => SigninPage(),
    ),
  ]);
}
