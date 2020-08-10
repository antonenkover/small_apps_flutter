import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.text, @required this.function});
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kBottomTextStyle,
          ),
        ),
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}
