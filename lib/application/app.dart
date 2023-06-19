import 'package:flutter/material.dart';
import 'package:test_1/application/log_in/login_screen.dart';
import 'package:test_1/application/picture%20&%20location/home_screen.dart';
import 'package:test_1/data/user_repository.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: UserRepository().validateToken(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return const HomePage();
            } else {
              return const LoginScreen();
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
