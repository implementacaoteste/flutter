import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 25,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                            'https://avatars.githubusercontent.com/u/13559517?v=4'),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Row(
                      children: [
                        DropdownButton(
                            items: const [
                              DropdownMenuItem(
                                value: 'real',
                                child: Text('Real'),
                              ),
                              DropdownMenuItem(
                                value: 'dolar',
                                child: Text('Dolar'),
                              ),
                              DropdownMenuItem(
                                value: 'euro',
                                child: Text('Euro'),
                              ),
                              DropdownMenuItem(
                                value: 'bitcoin',
                                child: Text('Bitcoin'),
                              ),
                            ],
                            onChanged: (value) {
                              print(value);
                            }),
                        Container(
                          width: 10,
                        ),
                        Container(
                          height: 30,
                          width: 110,
                          color: Colors.black,
                          child: TextField(
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.green,
                          height: 100,
                          width: 100,
                        ),
                        Container(
                          color: Colors.black,
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.green,
                          height: 100,
                          width: 100,
                        ),
                        Container(
                          color: Colors.black,
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  print('converter');
                },
                child: Text('CONVERTER')),
          ],
        ),
      ),
    );
  }
}
