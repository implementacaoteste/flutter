import 'package:flutter/material.dart';

import 'app/models/views/home_page.dart';

void main(List<String> args) {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}
