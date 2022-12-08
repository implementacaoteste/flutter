import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(AppWidget(
    title: 'ffff',
  ));
}

class AppWidget extends StatelessWidget {
  final String title;

  //const AppWidget({super.key, required this.title});
  const AppWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Container(
        child: Center(child: Text('Erisvaldo')),
      ),
    );
  }
}
