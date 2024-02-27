import 'package:flatter1_exam/pages/derailes_page.dart';
import 'package:flutter/material.dart';

import '../models/credit_card_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CreditCard> cards = [
    CreditCard(
        cardNumber: '8888 8888 8888 8888',
        expiredDate: '12/12',
        cardType: 'visa',
        cardImage: 'assets/images/ic_card_visa.png'),
    CreditCard(
        cardNumber: '7777 7777 7777 7777',
        expiredDate: '12/20',
        cardType: 'master',
        cardImage: 'assets/images/ic_card_master.png'),
  ];

  Future _openDetailsPage() async {
    CreditCard result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const DetailsPage();
        },
      ),
    );

    setState(() {
      cards.add(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My Cards'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 30),
                itemCount: cards.length,
                itemBuilder: (ctx, i) {
                  return _itemOfCardList(cards[i]);
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              child: MaterialButton(
                onPressed: () {
                  _openDetailsPage();
                },
                child: const Text(
                  'Add Card',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemOfCardList(CreditCard creditCard) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: Image(image: AssetImage(creditCard.cardImage!)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '**** **** **** ${creditCard.cardNumber!.substring(creditCard.cardNumber!.length - 4)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                creditCard.expiredDate!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}