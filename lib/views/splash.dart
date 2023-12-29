import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providrors/AuthProvider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(

          /// this line is cousing continues rebuilding , search for futurebuilder api called once
          future: context.read<AuthProvider>().readFromStorage(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data.toString().isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                context.pushNamed('home');
              });
            } else {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                context.pushNamed('signup');
              });
            }
            return SizedBox();
          }),
    );
  }
}
