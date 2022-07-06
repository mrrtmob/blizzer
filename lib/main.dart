import 'package:blizzer/admin/admin_screen/upload/admin_upload_screen.dart';
import 'package:blizzer/configureAmplify.dart';
import 'package:blizzer/screens/sign_in/sign_in_screen.dart';
import 'package:blizzer/size_config.dart';
import 'package:flutter/material.dart';
import 'package:blizzer/routes.dart';
import 'package:blizzer/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    configureAmplify().then((value){
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blizzer',
      theme: theme(),
      initialRoute: AdminUploadScreen.routeName,
      routes: routes,
    );
  }
}
