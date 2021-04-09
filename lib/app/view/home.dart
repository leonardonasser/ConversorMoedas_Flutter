import 'package:conversor_moeda/app/components/currency_box.dart';
import 'package:conversor_moeda/app/controllers/homeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 20),
          child: ListView(
            children: [
              Image.asset(
                'assets/images/logo2.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 50,
              ),
              CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model;
                    });
                    print(model.name);
                  }),
              SizedBox(
                height: 10,
              ),
              CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model;
                    });
                    print(model.name);
                  }),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                color: Colors.amber[800],
                onPressed: () {
                  homeController.convert();
                },
                child: Text('CONVERTER'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
