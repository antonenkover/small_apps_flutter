import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(xylofonMusic());

class birdSounds extends StatefulWidget {
  @override
  _birdSoundsState createState() => _birdSoundsState();
}

class _birdSoundsState extends State<birdSounds> {
  void birdSound(int soundNumber, String format) {
    final player = AudioCache();
    player.play('bird$soundNumber.$format');
  }

  Widget birdPicture({int birdNumber, String format}) {
    return FlatButton(
      child: CircleAvatar(
        backgroundImage: AssetImage('images/bird$birdNumber.jpg'),
        radius: 70.0,
      ),
      onPressed: () {
        birdSound(birdNumber, format);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listen To The Birds'),
          backgroundColor: Colors.grey[900],
        ),
        backgroundColor: Colors.grey[700],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  birdPicture(birdNumber: 1, format: 'wav'),
                  birdPicture(birdNumber: 2, format: 'wav'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  birdPicture(birdNumber: 3, format: 'wav'),
                  birdPicture(birdNumber: 4, format: 'mp3'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  birdPicture(birdNumber: 5, format: 'm4a'),
                  birdPicture(birdNumber: 6, format: 'wav'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class xylofonMusic extends StatefulWidget {
  @override
  _xylofonMusicState createState() => _xylofonMusicState();
}

class _xylofonMusicState extends State<xylofonMusic> {
  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Widget singleKey({int noteNumber, Color noteColor}) {
    return Expanded(
      child: FlatButton(
        color: noteColor,
        onPressed: () {
          playSound(noteNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              singleKey(noteNumber: 1, noteColor: Colors.red),
              singleKey(noteNumber: 2, noteColor: Colors.orange),
              singleKey(noteNumber: 3, noteColor: Colors.yellow),
              singleKey(noteNumber: 4, noteColor: Colors.green),
              singleKey(noteNumber: 5, noteColor: Colors.teal),
              singleKey(noteNumber: 6, noteColor: Colors.blue),
              singleKey(noteNumber: 7, noteColor: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
