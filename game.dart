import 'dart:math';

class Game{
  final int _answer; //final cant assign in body constructor but can assign in initialize list
  int _totalGuess = 0;


  Game() : _answer = Random().nextInt(100)+1{
    print("The answer is : $_answer ");
  }
  /*int getTotalGuess(){
    return _totalGuess;
  }*/
  int get totalGuess { // getter method in dart
    return _totalGuess;
  }
  int doGuess(int num){
    _totalGuess++;
    if(num > _answer){
      return 1;
    }
    else if(num < _answer) {
      return -1;
    }
    else {
      return 0;
    }
  }
}