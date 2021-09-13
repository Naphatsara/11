import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'game.dart'; // can put name file without path cause stay in same package

class GamePage3 extends StatefulWidget {
  const GamePage3({Key? key}) : super(key: key);

  @override
  _GamePage2State createState() => _GamePage2State();
}

class _GamePage2State extends State<GamePage3> {
  Game? _game;
  final TextEditingController _controller = TextEditingController();
  String? _guessNumber;
  String? _feedback;
  bool _check = false;
  List<dynamic> history = [];

  @override
  void initState() {
    super.initState();
    _game = Game();
  }
  _handleGame(){
    setState(() {
      _check = false;
      _game = Game();
      _guessNumber = null;
      _feedback = null;
      history.clear();
    });

  }
  _setCheck(){
    setState(() {
      _check = !_check;
      int total = _game!.totalGuess;
      _showMaterialDialog('GOOD JOB!', 'The answer is $_guessNumber\nYou have made $total guesses\nAll your guesses is $history');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GUESS THE NUMBER'),
      ),
      body: Container(
        color: Colors.yellow.shade100,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeader(),
                _buildMainContent(),
                _buildInputPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          "assets/images/logo_number.png",
          width: 240.0,
        ),
        Text(
          ' - Guess The Number - ',
          style: GoogleFonts.ptSerif(fontSize: 22.0),
        ),
      ],
    );
  }

  Widget _buildMainContent() {
    return _guessNumber == null
        ? Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check,size: 70.0,color: Colors.green,),
                Icon(Icons.clear,size: 70.0,color: Colors.red,),
              ],
            ),
            Text("I'm think of number between 1 and 100.",style: GoogleFonts.ptSerif(fontSize: 17.0),),
            Text("Can you guess it?",style: GoogleFonts.ptSerif(fontSize: 30.0),)
          ],
        )
        : Column(
            children: [
              Text(
                _guessNumber!,
                style: GoogleFonts.ptSerif(fontSize: 70.0),
              ),
              Column(
                children: [
                  Text(
                    _feedback!,
                    style: GoogleFonts.ptSerif(fontSize: 30.0),
                  ),
                  if(_check)
                  Icon(Icons.check,size: 45.0,color: Colors.green,),
                  if(!_check)
                  Icon(Icons.clear,size: 45.0,color: Colors.red,),
                ],
              ),
              //if()
              if(_check)
              TextButton(
                  onPressed: _handleGame,
                  child: Text('NEW GAME')),
            ],
          );
  }

  Widget _buildInputPanel() {
    return Card( // or container
      color: Colors.blue.shade300,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              //or Flexible
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: Colors.yellow,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  isDense: true,
                  // กำหนดลักษณะเส้น border ของ TextField ในสถานะปกติ
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  // กำหนดลักษณะเส้น border ของ TextField เมื่อได้รับโฟกัส
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Enter the number here',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 16.0,
                  ),
                ),

              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _guessNumber = _controller.text;
                  int? guess = int.tryParse(_guessNumber!);
                  history.add(guess);
                  if (guess != null) {
                    var result = _game!.doGuess(guess);
                    if (result == 0) {
                      _setCheck();
                      _feedback = 'CORRECT!';
                    } else if (result == 1) {
                      _feedback = 'TOO HIGH';
                    } else {
                      _feedback = 'TOO LOW';
                    }
                  }
                  _controller.clear();
                });
              },
              child: Text('GUESS'),
            ),
          ],
        ),
      ),
    );
  }
}
