import 'package:flutter/material.dart';
import './widgets/TweetList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TweetList());
  }
}
