import 'package:flutter/material.dart';

class GamePage2 extends StatefulWidget {
  const GamePage2({Key? key}) : super(key: key);

  @override
  _GamePage2State createState() => _GamePage2State();
}

class _GamePage2State extends State<GamePage2> {
  List<int> list = [1, 2, 3];
  bool showNumber = true; //state ในการควบคุมว่าจะแสดงตัวเลขออกมาไหม
  //var i = 0; //เป็นตัวแปร state >> เปลี่ยนแปลงค่าได้ >> render ใหม่ได้

  //event handle =  _handleClickButton()/ _handleClickButton2()
  _handleClickButton() {
    setState(() {
      list.add(list.length + 1);
      //i = i+10;
    });
  }

  _handleClickButton2() {
    setState(() {
      showNumber = !showNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: list.map((e) => Text(e.toString())).toList(),
                  )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: _handleClickButton, child: Text('test')),
              TextButton(onPressed: _handleClickButton2, child: Text('test2'))
            ],
          ),
          Image(
            image: AssetImage(showNumber ? 'assets/images/op.png' : 'assets/images/p.png'),
            width: 200.0,
          ),
        ]),
      ),
    );
  }
}
