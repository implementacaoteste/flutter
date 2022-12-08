import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          'Meu contador',
        ),
      ),
      body: Container(
        height: 200,
        width: 200,
        color: Colors.black,
        child: Center(
            child: Container(
          width: 110,
          height: 110,
          color: Colors.yellow,
        )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(
            () {
              counter++;
            },
          );
        },
      ),
    );
  }
}
