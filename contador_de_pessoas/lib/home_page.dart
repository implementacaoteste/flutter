import 'dart:ffi';

import 'package:contador_de_pessoas/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                  'https://avatars.githubusercontent.com/u/13559517?v=4'),
            ),
            accountEmail: const Text('erisvaldocarvalhosilva@gmail.com'),
            accountName: const Text('Erisvaldo'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Início'),
            subtitle: Text('Tela de início'),
            onTap: () {
              print('Home');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            subtitle: Text('Finalizar seção'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ]),
      ),
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          'Meu contador',
        ),
        actions: [CustomSwitch()],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador $counter'),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            CustomSwitch(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
              ],
            )
          ],
        ),
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

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (bool value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
