import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamePages extends StatelessWidget {
  const GamePages({Key? key}) : super(key: key);

  Widget _buildButton(var number) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 75.0,
        height: 75.0,
        //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black38, width: 2.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // สีเงา
                offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]),
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 50.0,
                      color: Colors.black26,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'กรุณาใส่รหัสผ่าน',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ],
                ),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [1,2,3].map((item) {
                    return _buildButton(item);
                  }).toList(),
                   /* for(var i = 1 ; i<4 ; i++) ต้องแก้เป็น int ก่อนค่อยวน loop
                    *_buildButton(i)*/

                    /*_buildButton(1),
                    _buildButton(2),
                    _buildButton(3),*/

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [4,5,6].map((item) {
                    return _buildButton(item);
                  }).toList(),
                    /*_buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),*/

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [7,8,9].map((item) {
                    return _buildButton(item);
                  }).toList(),
                    /*_buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),*/

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 75.0,
                      width: 75.0,
                    ),
                    _buildButton(0),
                    Container(
                      height: 75.0,
                      width: 75.0,
                      child: Icon(
                        Icons.backspace_outlined,
                        size: 40.0,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('ลืมรหัสผ่าน'),
                    ),
                  ),

            ]),
      ),
    );
  }
}
