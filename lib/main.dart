// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 109, 93),
      appBar: AppBar(
        title: Text('لعبةالتطابق'),
        backgroundColor: Color.fromARGB(255, 13, 59, 56),
      ),
      body: ImagePage11(),
    ),
  ));
}

class ImagePage11 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Stat();
}

class _Stat extends State<ImagePage11> {
  int numberofImage_Lift = 1;
  int numberofImage_Right = 2;
  int NWin = 0;
  int NLoss = 0;

  String Alert = 'حاول مرة اخرى';

  void RandomNumberImage() {
    numberofImage_Lift = Random().nextInt(16) + 1;
    numberofImage_Right = Random().nextInt(16) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Alert,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 45.0,
            color: Color.fromARGB(255, 225, 255, 255),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      RandomNumberImage();
                      if (numberofImage_Lift == numberofImage_Right) {
                        Alert = 'لقد فزت الصورتان متطابقتان';
                        NWin++;
                      } else {
                        Alert = 'حاول مرة اخرى';
                        NLoss++;
                      }
                    });
                  },
                  child: Image.asset('images/$numberofImage_Lift.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      RandomNumberImage();
                      if (numberofImage_Lift == numberofImage_Right) {
                        Alert = 'لقد فزت الصورتان متطابقتان';
                        NWin++;
                      } else {
                        Alert = 'حاول مرة اخرى';
                        NLoss++;
                      }
                    });
                  },
                  child: Image.asset('images/$numberofImage_Right.png'),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'لتلعب..اضغط على الصورة ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 45.0,
                    color: Color.fromARGB(255, 225, 255, 255),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "الفوز = $NWin" + " الخسارة = $NLoss",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Color.fromARGB(246, 56, 177, 32),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      NLoss = 0;
                      NWin = 0;
                      numberofImage_Lift = 1;
                      numberofImage_Right = 2;
                    });
                  },
                  child: Icon(
                    Icons.replay,
                    size: 40.0,
                    color: Color.fromARGB(255, 248, 1, 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
