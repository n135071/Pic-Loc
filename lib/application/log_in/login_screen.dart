import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_1/application/log_in/login_bloc.dart';
import 'package:test_1/application/log_in/login_body.dart';
import 'package:test_1/application/log_in/login_state.dart';
import '../picture & location/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    double width = mediaQuery.width;
    return BlocProvider(
      create: (context) => LoginBloc(LoginInitialState()),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, LoginState state) {
          if (state is LoginLoading) {
            showDialog(
                context: context,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()));
          } else if (state is LoginFailed) {
            Navigator.of(context).pop();
            Fluttertoast.showToast(msg: state.errorMessage);
          } else if (state is LoginCompleted) {
            /* Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()),

            );*/
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (Route route) => false);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'LogIn',
              style: TextStyle(
                fontSize: width / 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: const LoginBody(),
        ),
      ),
    );
  }
}
