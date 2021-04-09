import 'package:conversor_moeda/app/controllers/homeController.dart';
import 'package:conversor_moeda/app/models/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test('Tem que converter de real para dolar', () {
    toText.text = '1.0';
    homeController.toCurrency = Currency(
        name: 'Dolar', real: 5.63, dolar: 1.0, euro: 0.85, bitcoin: 0.000088);
    homeController.fromCurrency = Currency(
        name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);

    homeController.convert();
    expect(fromText.text, '5.63');
  });
}
