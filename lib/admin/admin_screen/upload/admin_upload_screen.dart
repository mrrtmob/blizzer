import 'package:blizzer/admin/admin_screen/upload/components/body.dart';
import 'package:blizzer/components/custom_surfix_icon.dart';
import 'package:blizzer/components/form_error.dart';
import 'package:blizzer/constants.dart';
import 'package:flutter/material.dart';

class AdminUploadScreen extends StatefulWidget {
  const AdminUploadScreen({Key? key}) : super(key: key);
  static String routeName = "/admin_upload";

  @override
  State<AdminUploadScreen> createState() => _AdminUploadScreenState();
}

class _AdminUploadScreenState extends State<AdminUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(),);
  }
}
