import 'package:audiofileplayer/audiofileplayer.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _randomColor = Colors.blueGrey.shade400;

  void _changeBackgroundColor() {
    setState(() {
      _randomColor = ColorGenerator.getColor();
    });
  }

  void playSound(int noteNumber) {
    Audio.load('assets/note$noteNumber.wav')
      ..play()
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: _randomColor,
        child: InkWell(
          onTap: () {
            _changeBackgroundColor();
            playSound(Random().nextInt(7));
          },
          child: Center(
            child: Text(
              "Hey there",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Pacifico",
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorGenerator {
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
  }
}
