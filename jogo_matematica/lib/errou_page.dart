import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ErrouPage extends StatefulWidget {
  const ErrouPage({super.key});

  @override
  State<ErrouPage> createState() => _ErrouPageState();
}

class _ErrouPageState extends State<ErrouPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.close,
          size: 32.0,
          color: Colors.red,
        ),
        Icon(
          Icons.clear,
          size: 32.0,
          color: Colors.red,
        ),
        Icon(
          Icons.thumb_down,
          size: 32.0,
          color: Colors.red,
        ),
      ],
    );
  }
}
