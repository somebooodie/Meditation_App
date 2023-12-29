import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app/providrors/AuthProvider.dart';
import 'package:meditation_app/views/StaticPage.dart';
import 'package:meditation_app/views/signin.dart';
import 'package:meditation_app/views/signup.dart';
// ... other necessary imports

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Meditation App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: "/",
            name: "home",
            builder: (context, state) {
              final authProvider =
                  Provider.of<AuthProvider>(context, listen: false);
              if (authProvider.isAuthenticated) {
                // Navigate to the HomePage with the current user data
                return HomePage(authProvider.currentUser!);
              } else {
                // Navigate to the StaticPage if not authenticated
                return MyStaticPage();
              }
            },
          ),
          GoRoute(
            path: "/signup",
            name: 'signup',
            builder: (context, state) => SignupPage(),
          ),
          GoRoute(
            path: "/signin",
            name: "signin",
            builder: (context, state) => SigninPage(),
          ),
          // ... other routes
        ],
      ),
    );
  }
}
