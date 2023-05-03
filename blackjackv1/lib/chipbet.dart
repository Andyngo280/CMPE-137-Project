import 'package:blackjackv1/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'HomeChip': (context) => const HomeChip(),
      },
      initialRoute: 'HomeChip',
    );
  }
}

class HomeChip extends StatelessWidget {
  const HomeChip({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Options",
              style: TextStyle(fontSize: 22.0),
            ),
            centerTitle: true,
            backgroundColor: Colors.black),
        body: const DecoratedBox(
            // BoxDecoration takes the image
            decoration: BoxDecoration(
              // Image set to background of the body
              image: DecorationImage(
                  image: AssetImage("assets/images/blackjackbackground3.png"),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: BettingScreen(onOff: true),
            )));
  }
}

class BettingScreen extends StatefulWidget {
  final bool onOff;
  const BettingScreen({super.key, required this.onOff});
  @override
  State<BettingScreen> createState() => BettingScreenState();
}

class BettingScreenState extends State<BettingScreen> {
  int betAmount = 0;
  int totalBetAmount = 0;
  int balance = 1000;

  void _addBet() {
    if (totalBetAmount + betAmount > balance) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Insufficient Funds'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      setState(() {
        totalBetAmount += betAmount;
        balance -= betAmount;
        betAmount = 0;
      });
    }
  }

  void _betAll() {
    setState(() {
      totalBetAmount = balance;
    });
    _addBet();
  }

  void _clearBet() {
    setState(() {
      betAmount = 0;
      totalBetAmount = 0;
      balance = 1000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    betAmount = 10;
                  });
                  _addBet();
                },
                child: Chip(
                  label: const Text('\$10'),
                  backgroundColor: betAmount == 10 ? Colors.green : Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    betAmount = 20;
                  });
                  _addBet();
                },
                child: Chip(
                  label: const Text('\$20'),
                  backgroundColor: betAmount == 20 ? Colors.green : Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    betAmount = 50;
                  });
                  _addBet();
                },
                child: Chip(
                  label: const Text('\$50'),
                  backgroundColor: betAmount == 50 ? Colors.green : Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    betAmount = 100;
                  });
                  _addBet();
                },
                child: Chip(
                  label: const Text('\$100'),
                  backgroundColor:
                      betAmount == 100 ? Colors.green : Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _betAll,
                child: const Chip(
                  label: Text('All In'),
                  backgroundColor: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _clearBet,
                child: const Chip(
                  label: Text('Clear'),
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text('Total Bet Amount: \$$totalBetAmount'),
        const SizedBox(height: 8),
        Text('Balance: \$$balance'),
        const SizedBox(height: 13),
        SizedBox(
          width: 120,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              if (totalBetAmount + betAmount > balance) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Insufficient Funds'),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                setState(() {
                  totalBetAmount += betAmount;
                  balance -= betAmount;
                  betAmount = 0;
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              shape: const StadiumBorder(),
            ),
            child: const Text('Place Bet'),
          ),
        ),
      ],
    );
  }
}
