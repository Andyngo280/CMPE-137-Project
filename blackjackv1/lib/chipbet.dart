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
          "Betting",
          style: TextStyle(fontSize: 22.0),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1A4678),
      ),
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
        ),
      ),
    );
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
    if (totalBetAmount + betAmount > balance &&
        totalBetAmount + betAmount <= 500) {
      // bet is within balance limit, but insufficient funds
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Insufficient Funds'),
          backgroundColor: Colors.red,
        ),
      );
    } else if (totalBetAmount + betAmount > 1000) {
      // bet is greater than balance limit
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Maximum bet amount reached'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // bet is valid
      setState(() {
        totalBetAmount += betAmount;
        balance -= betAmount;
        betAmount = 0;
      });
    }
  }

  void _betAll() {
    setState(() {
      betAmount = balance;
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
        const SizedBox(height: 220),
        SizedBox(
          width: 150,
          height: 60,
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
              backgroundColor: const Color(0xFF1A4678),
              foregroundColor: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              shape: const StadiumBorder(),
            ),
            child: const Text('Deal!'),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                onPressed: balance <= 999 ? null : () {
                  setState(() {
                    betAmount = balance;
                  });
                  _addBet();
                },
                style: ElevatedButton.styleFrom(
                  primary: betAmount == balance ? Colors.green : Colors.grey,
                  backgroundColor: const Color(0xFF1A4678),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                child: const Text('All In'),
              ),
            ),
            const SizedBox(width: 40),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                onPressed: _clearBet,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A4678),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                child: const Text('Clear'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Bank: \$$balance',
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(width: 20),
            Text('In: \$$totalBetAmount',
                style:
                const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 20),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    betAmount = 1;
                  });
                  _addBet();
                },
                child: const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/images/chip1.png'),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  setState(() {
                    betAmount = 5;
                  });
                  _addBet();
                },
                child: const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/images/chip5.png'),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  setState(() {
                    betAmount = 25;
                  });
                  _addBet();
                },
                child: const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/images/chip25.png'),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    betAmount = 50;
                  });
                  _addBet();
                },
                child: const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/images/chip50.png'),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  setState(() {
                    betAmount = 100;
                  });
                  _addBet();
                },
                child: const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/images/chip100.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
