import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('some'),
      ),
      body: Container(
        child: RaisedButton(
          child: Text('some'),
          onPressed: null,
        ),
      ),
    );
  }
}
