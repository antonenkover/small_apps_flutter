import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Ask Me Anything'),
            actions: <Widget>[],
            backgroundColor: Colors.indigo[700],
          ),
          body: askMeAnything(),
        ),
      ),
    );

class askMeAnything extends StatefulWidget {
  @override
  _askMeAnythingState createState() => _askMeAnythingState();
}

class _askMeAnythingState extends State<askMeAnything> {
  int ballAnswer = 1;

  void ballGiveAnswer() {
    setState(() {
      ballAnswer = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Colors.indigo[800], Colors.white]),
      ),
      child: FlatButton(
        child: Image.asset('images/ball$ballAnswer.png'),
        onPressed: () {
          ballGiveAnswer();
        },
      ),
    );
  }
}
