//Classe correspondente a moéda

class CurrencyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

/*
o que significa a palavra 'final' neste código?

A palavra-chave 'final' em um atributo ou método de classe significa que o valor 
da propriedade ou o comportamento do método não pode ser alterado depois de ser
definido. Isso significa que uma vez que o valor de uma propriedade 'final' é 
definido, ele não pode mais ser alterado pelo código do programa. No caso do 
código que você forneceu, todas as propriedades da classe CurrencyModel são 
declaradas como 'final', o que significa que seus valores não podem ser alterados 
depois de serem definidos.
*/

  CurrencyModel(
      {required this.name,
      required this.real,
      required this.dolar,
      required this.euro,
      required this.bitcoin});

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
        name: 'Real',
        real: 1,
        dolar: 0.18,
        euro: 0.15,
        bitcoin: 0.00016,
      ),
      CurrencyModel(
        name: 'Dolar',
        real: 5.65,
        dolar: 1,
        euro: 0.85,
        bitcoin: 0.000088,
      ),
      CurrencyModel(
        name: 'Euro',
        real: 6.62,
        dolar: 1.17,
        euro: 1.0,
        bitcoin: 0.00010,
      ),
      CurrencyModel(
          name: 'Bitcoin',
          real: 64116.51,
          dolar: 11351.30,
          euro: 9689.54,
          bitcoin: 1),
    ];
  }
}
