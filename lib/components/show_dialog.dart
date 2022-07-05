import 'package:blizzer/constants.dart';
import 'package:flutter/material.dart';

showLoaderDialog(BuildContext context,String alertText) {
  
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(color: kPrimaryColor ),
          Container(
            margin: EdgeInsets.only(left: 8),child:Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(alertText ),
            )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }