import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  final String title;

  const PopUp({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, textAlign: TextAlign.center,),
      content: Container(
        height: 50,
        child: Center(child: CircularProgressIndicator(),),
      ),
      contentPadding: EdgeInsets.all(50),
    );
  }
}
