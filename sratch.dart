import 'dart:io';

void main() {
  taskOne();
  taskTwo();
  taskThree();
}

void taskOne() {
  String result = 'this is taskOne';
  print('taskOne');
}

void taskTwo() async {
  Duration fiveSconds = Duration(seconds: 5);
  sleep(fiveSconds);
  // Future.delayed(fiveSconds, () {
  //   String result = 'taskTwo';
  //   print(result);
  // });
  print("taskTwo");
}

void taskThree() {
  print('taskThree');
}
