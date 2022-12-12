import 'package:contador_de_pessoas/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                //height: 100,
                //width: 100,
                child: Image.asset('assets/images/supercandida.jpg'),
              ),
              TextField(
                onChanged: (text) {
                  email = text;
                },
                keyboardType: TextInputType.emailAddress,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: const OutlineInputBorder(),
                ),
              ),
              Container(
                height: 20,
              ),
              TextField(
                onChanged: (text) {
                  senha = text;
                },
                obscureText: true,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: const OutlineInputBorder(),
                ),
              ),
              Container(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (email == 'erisvaldo@gmail.com' && senha == '123456')
                    Navigator.of(context).pushReplacementNamed('/home');
                  else if (kDebugMode) print('Usuário ou senha incorreta!');
                },
                child: const Text('Entrar'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
