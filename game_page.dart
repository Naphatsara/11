import 'dart:math';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> iconList = [
      //Icon(Icons.star, size: 30.0, color: Colors.amber),
      // Icon(Icons.star, size: 30.0, color: Colors.amber),
      //Icon(Icons.star, size: 30.0, color: Colors.amber),
      //Icon(Icons.star, size: 30.0, color: Colors.amber),
      //Icon(Icons.star_border, size: 30.0, color: Colors.amber),
    ];
    for(var i = 0 ; i<4 ; i++){
      iconList.add(Icon(Icons.star, size: 30.0, color: Colors.amber));
    }
    iconList.add(Icon(Icons.star_border, size: 30.0, color: Colors.amber));
    return Scaffold(
      appBar: AppBar(
        title: Text('GUESS THE NUMBER'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 90.0,
                  color: Colors.pink,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'นภัสสรา ทองโสภณ',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 22.0),
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: iconList,
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: Text(
                '${Random().nextInt(100)}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 90.0, color: Colors.amberAccent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('RANDOM'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
