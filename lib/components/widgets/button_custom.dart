import 'package:flutter/material.dart';
import 'package:testeapi/components/shered/app_colors.dart';
class ButtonCustom extends StatefulWidget {
  final Function ontap;
  final String title;

  const ButtonCustom({Key key, this.ontap, this.title}) : super(key: key);
  @override
  _ButtonCustomState createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22.0),
      child: Container(
        height: 60,
        child: SizedBox.expand(
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
            ),
            color: Colors.blue[900],
            onPressed: widget.ontap,
            child: Text(widget.title, style: TextStyle(fontSize: 17, color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
