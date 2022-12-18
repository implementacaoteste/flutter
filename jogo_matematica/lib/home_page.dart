import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _iniarVariaveis = true;
  int _resposta = 0;
  final int GANHA_ESTRELA =
      4; //Quando o nível chega neste valor o usuário ganha uma estrela.
  int _nivelAdicao = 1;
  int _nivelSubtracao = 1;
  int _nivelMultiplicacao = 1;
  int _nivelDivisao = 1;
  int _acertoSequencialAdicao = 0;
  int _acertoSequencialSubtracao = 0;
  int _acertoSequencialMultiplicacao = 0;
  int _acertoSequencialDivisao = 0;
  int _min = 1;
  int _max = 5;
  Random random = Random();
  int _x = 2;
  int _y = 3;
  int _temp = 1;
  String _operador = '+';
  int _moedas = 0;
  int _vidas = 3;
  int _estrelas = 0;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    iniciarVariaveis();
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
            for (int i = 0; i < _vidas; i++)
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            for (int i = _vidas; i < 3; i++)
              Icon(
                Icons.favorite,
                color: Colors.black38,
              ),
            for (int i = 0; i < _estrelas; i++)
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            for (int i = _estrelas; i < 5; i++)
              Icon(
                Icons.star,
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
                  '$_operador'.padRight(_x.toString().length, ' '),
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
                  child: Icon(Icons.delete),
                ),
                Container(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_moedas >= 2) {
                          gerarDesafio();
                          _moedas -= 2;
                          _acertoSequencialAdicao = 0;
                          _acertoSequencialSubtracao = 0;
                          _acertoSequencialMultiplicacao = 0;
                          _acertoSequencialDivisao = 0;
                          _controller.clear();
                        } else {}
                      });
                    },
                    child: Text('Pular -2 moedas')),
              ],
            ),
            Container(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  checarAcerto();
                },
                child: Text('Checar')),
          ],
        ),
      ]),
    );
  }

  void checarAcerto() {
    if (_resposta != '')
      switch (_operador) {
        case '+':
          if (_x + _y == _resposta) {
            acertou();
          } else {
            _nivelAdicao--;
            errou();
          }
          break;
        case '-':
          if (_x - _y == _resposta) {
            acertou();
          } else {
            _nivelSubtracao--;
            errou();
          }
          break;
        case 'x':
          if (_x * _y == _resposta) {
            acertou();
          } else {
            _nivelMultiplicacao--;
            errou();
          }
          break;
        case '÷':
          if (_x / _y == _resposta) {
            acertou();
          } else {
            _nivelDivisao--;
            errou();
          }
          break;
        default:
          break;
      }
  }

  void errou() {
    setState(() {
      _acertoSequencialAdicao = 0;
      _acertoSequencialSubtracao = 0;
      _acertoSequencialMultiplicacao = 0;
      _acertoSequencialDivisao = 0;
      _moedas -= 5;

      _vidas--;
      if (_vidas < 0) _vidas = 0;
      if (_nivelAdicao < 1) _nivelAdicao = 1;
      if (_nivelSubtracao < 1) _nivelSubtracao = 1;
      if (_nivelMultiplicacao < 1) _nivelMultiplicacao = 1;
      if (_nivelDivisao < 1) _nivelDivisao = 1;
      if (_moedas < 0) _moedas = 0;
      _controller.clear();
    });
  }

  void acertou() {
    setState(() {
      _acertoSequencialAdicao++;
      _acertoSequencialSubtracao++;
      _acertoSequencialMultiplicacao++;
      _acertoSequencialDivisao++;
      if (_operador == '+' && _acertoSequencialAdicao >= 5 ||
          _operador == '-' && _acertoSequencialSubtracao >= 5 ||
          _operador == 'x' && _acertoSequencialMultiplicacao >= 5 ||
          _operador == '÷' && _acertoSequencialMultiplicacao >= 5) {
        ganharMoedasBonus();
      } else {
        _moedas++;
      }
      gerarDesafio();
      _controller.clear();
    });
  }

  void ganharMoedasBonus() {
    if (_vidas < 3) {
      _vidas++;
      _moedas++;
    } else {
      _moedas += 5;
    }

    switch (_operador) {
      case '+':
        _acertoSequencialAdicao = 0;
        _nivelAdicao++;
        break;
      case '-':
        _acertoSequencialSubtracao = 0;
        _nivelSubtracao++;
        break;
      case 'x':
        _acertoSequencialMultiplicacao = 0;
        _nivelMultiplicacao++;
        break;
      case '÷':
        _acertoSequencialDivisao = 0;
        _nivelDivisao++;
        break;
      default:
    }
  }

  void gerarDesafio() {
    _temp = selecionarOperador();

    switch (_temp) {
      case 1:
        _operador = '+';
        gerarDesafioDeAdicao();
        break;
      case 2:
        _operador = '-';
        gerarDesafioDeSubtracao();
        break;
      case 3:
        _operador = 'x';
        gerarDesafioDeMultiplicacao();
        break;
      case 4:
        // _operador = '÷';
        // gerarDesafioDeDivisao();
        _operador = '+';
        gerarDesafioDeAdicao();
        break;
      default:
    }
  }

  void gerarDesafioDeAdicao() {
    _max = _nivelAdicao * 5;
    _x = _min + random.nextInt(_max - _min + 1);
    _y = _min + random.nextInt(_max - _min + 1);
  }

  void gerarDesafioDeSubtracao() {
    int aux;
    _max = _nivelSubtracao * 5;
    _x = _min + random.nextInt(_max - _min + 1);
    _y = _min + random.nextInt(_max - _min + 1);

    if (_x < _y) {
      aux = _x;
      _x = _y;
      _y = aux;
    }
  }

  void gerarDesafioDeMultiplicacao() {
    // _max = _nivelMultiplicacao * 5;
    // _x = _min + random.nextInt(_max - _min + 1);
    // _y = _min + random.nextInt(_max - _min + 1);
    _x = 1 + random.nextInt(5);
    _y = 1 + random.nextInt(5);
  }

  void gerarDesafioDeDivisao() {
    _max = _nivelDivisao * 5;
    _x = _min + random.nextInt(_max - _min + 1);
    _y = _min + random.nextInt(_max - _min + 1);
  }

  int selecionarOperador() {
    int retorno = 1;

    mostrarStatus();
    _estrelas = 0;
    if (_nivelAdicao > GANHA_ESTRELA) _estrelas++;
    if (_nivelSubtracao > GANHA_ESTRELA) _estrelas++;
    if (_nivelMultiplicacao > GANHA_ESTRELA) _estrelas++;
    if (_nivelDivisao > GANHA_ESTRELA) _estrelas++;

    if (_nivelAdicao > GANHA_ESTRELA) {
      if (_nivelSubtracao > GANHA_ESTRELA) {
        if (_nivelMultiplicacao > GANHA_ESTRELA) {
          if (_nivelDivisao > GANHA_ESTRELA) {
            retorno = 1 + random.nextInt(4);
          }
        } else {
          retorno = 1 + random.nextInt(3);
        }
      } else {
        retorno = 1 + random.nextInt(2);
        if (retorno != 2 && _nivelSubtracao < _nivelAdicao)
          for (int i = 0; retorno != 2 && i < 2; i++) {
            retorno = 1 + random.nextInt(2);
          }
      }
    } else {
      retorno = 1;
    }
    return retorno;
  }

  void iniciarVariaveis() {
    //_iniarVariaveis = false;
    if (_iniarVariaveis)
      setState(() {
        _resposta = 0;
        _nivelAdicao = 5;
        _nivelSubtracao = 1;
        _nivelMultiplicacao = 1;
        _nivelDivisao = 1;
        _acertoSequencialAdicao = 0;
        _acertoSequencialSubtracao = 0;
        _acertoSequencialMultiplicacao = 0;
        _acertoSequencialDivisao = 0;
        _min = 1;
        _max = 5;
        _x = random.nextInt(5);
        _y = random.nextInt(5);
        _temp = 1;
        _operador = '+';
        _moedas = 48;
        _vidas = 0;
        _estrelas = 1;
      });
    _iniarVariaveis = false;
  }

  void mostrarStatus() {
    print('_resposta: $_resposta');
    print('_min: $_min');
    print('_max: $_max');
    print('_x: $_x');
    print('_y: $_y');
    print('_temp: $_temp');
    print('_moedas: $_moedas');
    print('_vidas: $_vidas');
    print('_operador: $_operador');
    print('_acertoSequencialAdicao: $_acertoSequencialAdicao');
    print('_acertoSequencialSubtracao: $_acertoSequencialSubtracao');
    print('_acertoSequencialMultiplicacao: $_acertoSequencialMultiplicacao');
    print('_acertoSequencialDivisao: $_acertoSequencialDivisao');
    print('_nivelAdicao: $_nivelAdicao');
    print('_nivelSubtracao: $_nivelSubtracao');
    print('_nivelMultiplicacao: $_nivelMultiplicacao');
    print('_nivelDivisao: $_nivelDivisao');
  }
}
