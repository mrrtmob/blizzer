import 'package:blizzer/auth/check_signin.dart';
import 'package:blizzer/auth/sign_out.dart';
import 'package:blizzer/configureAmplify.dart';
import 'package:blizzer/constants.dart';
import 'package:blizzer/screens/home/home_screen.dart';
import 'package:blizzer/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: isUserSignedIn(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              print(snapshot.data);
              if (snapshot.data == true) {
                return HomeScreen();
              } else {
                return SignInScreen();
              }
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: kPrimaryColor,
              ));
            }
          }),
    );
  }
}
