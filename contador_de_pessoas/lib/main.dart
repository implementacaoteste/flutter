import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Container(
    child: const Center(
      child: Text(
        'asdf',
        textDirection: TextDirection.rtl,
        style: TextStyle(color: Colors.white, fontSize: 100.0),
      ),
    ),
  ));
}
