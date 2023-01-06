import 'package:flutter/material.dart';
import 'package:toonflix/widgets/Button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff181818),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Hey, Selena',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '\$5 194 182',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Button(
                        text: 'Transfer',
                        bgColor: Colors.amber,
                        textColor: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Button(
                        text: 'Request',
                        bgColor: Color(0xff1f2123),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Wallets',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                      children: List.generate(
                    cardList.length,
                    (i) => CurrencyCard(
                      index: i,
                      name: cardList[i].name,
                      amount: cardList[i].amount,
                      code: cardList[i].code,
                      icon: cardList[i].icon,
                      isInverted: cardList[i].isInverted,
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const cardList = [
  CurrencyCard(
    name: 'Euro',
    amount: '6 428',
    code: 'EUR',
    icon: Icons.euro_rounded,
  ),
  CurrencyCard(
    name: 'Bitcoin',
    amount: '9 785',
    code: 'BTC',
    icon: Icons.currency_bitcoin_rounded,
    isInverted: true,
  ),
  CurrencyCard(
    name: 'Dollar',
    amount: '428',
    code: 'USD',
    icon: Icons.attach_money_rounded,
  ),
];
