import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _resposta = 0;
  int _nivel = 1;
  int _acertoSequencial = 0;
  int _min = 1;
  int _max = 5;
  Random random = Random();
  int _x = 2;
  int _y = 3;
  int _moedas = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30, child: Image.asset('assets/images/coin.png')),
            Text('$_moedas'),
            Container(
              width: 10,
            ),
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            Icon(
              Icons.favorite,
              color: Colors.black38,
            ),
          ],
        ),
      ),
      body: Column(children: [
        Container(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 10,
            ),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://avatars.githubusercontent.com/u/13559517?v=4'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  _x.toString(),
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                Container(width: 150),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '+'.padRight(_x.toString().length, ' '),
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  _y.toString(),
                  style: TextStyle(fontSize: 40),
                ),
                Container(width: 150),
              ],
            ),
            Container(
              width: 200,
              color: Colors.white,
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                onChanged: (text) {
                  if (text != '')
                    _resposta = int.parse(text.replaceAll(' ', ''));
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_x + _y == _resposta) {
                    print('Acertou');
                    setState(() {
                      _max = _nivel * 5;
                      _x = _min + random.nextInt(_max - _min + 1);
                      _y = _min + random.nextInt(_max - _min + 1);
                      _acertoSequencial++;
                      print(_acertoSequencial);
                      print(_nivel);
                      if (_acertoSequencial == 5) {
                        _moedas += 5;
                        _acertoSequencial = 0;
                        _nivel++;
                      } else
                        _moedas++;
                      _controller.clear();
                    });
                  } else {
                    setState(() {
                      _acertoSequencial = 0;
                      _moedas -= 5;
                      _nivel--;
                      if (_nivel < 1) _nivel = 1;
                      if (_moedas < 0) _moedas = 0;
                    });
                    print('Errou');
                  }
                },
                child: Text('Checar')),
            Container(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                      });
                    },
                    child: Text('Limpar')),
                Container(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      print('Acertou');
                      setState(() {
                        if (_moedas >= 2) {
                          _x = _min + random.nextInt(_max - _min + 1);
                          _y = _min + random.nextInt(_max - _min + 1);
                          _moedas -= 2;
                          _acertoSequencial = 0;
                          _controller.clear();
                        } else {}
                      });
                    },
                    child: Text('Pular -2 moédas'))
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
