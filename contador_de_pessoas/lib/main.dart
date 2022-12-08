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
    return Container(
      child: Center(
        child: Text(
          title,
          textDirection: TextDirection.ltr,
          style: const TextStyle(color: Colors.white, fontSize: 100.0),
        ),
      ),
    );
  }
}
