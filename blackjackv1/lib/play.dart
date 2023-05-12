import 'package:flutter/material.dart';
import 'dealer.dart';
import 'service.dart';
import 'chipbet.dart';
import 'package:playing_cards/playing_cards.dart';

class SecondPage extends StatefulWidget {
  final int totalBetAmount;
  final int balance;
  final Function(int) onWin;
  final Function() onResetTotalBetAmount;
  final Function(int) onBalanceUpdate;


  const SecondPage({
    Key? key,
    required this.totalBetAmount,
    required this.balance,
    required this.onWin,
    required this.onResetTotalBetAmount,
    required this.onBalanceUpdate,
  }) : super(key: key);

  @override
  SecondPageState createState() => SecondPageState();
}


class SecondPageState extends State<SecondPage> {
  int _balance = 0;
  int _totalBetAmount = 0;
  final dealerService = Dealer();
  List<PlayingCard> playerHand = [];
  List<PlayingCard> dealerHand= [];

  void _dealCards() {
    setState(() {
      playerHand.clear();
      dealerHand.clear();
      playerHand = dealerService.drawCards(2);
      dealerHand = dealerService.drawCards(2);
    }
    );
  }

  void _hit() {
    setState(() {
      playerHand.addAll(dealerService.drawCards(1));
    });
  }

  @override
  void initState() {
    super.initState();
    _balance = widget.balance;
    _totalBetAmount = widget.totalBetAmount;
  }

  void _updateBalance(int amount) {
    setState(() {
      _balance += amount;
    });
  }

  void _resetTotalBetAmount() {
    setState(() {
      _totalBetAmount = 0;
    });
  }

  void _loseBetAmount() {
    setState(() {
      _resetTotalBetAmount();
      if (_balance <= 0) {
        showDialog(
          context: context,
          barrierDismissible: false, // user cannot dismiss the dialog by clicking outside
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Game Over!'),
              content: const Text(
                'You have no more money left to bet! Click Play Again to try again.',
              ),
              actions: <Widget>[
                SizedBox(
                  width: 125,
                  height: 50.0,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Text('Play Again', style: TextStyle(fontSize: 20.0)),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeChip()));
                      setState(() {
                        _balance = 1000;
                        _totalBetAmount = 0;
                      });
                      widget.onBalanceUpdate(_balance);
                      widget.onResetTotalBetAmount(); // reset the total bet amount to zero
                    },
                  ),
                ),
              ],
            );
          },
        );
      }
      else {
        widget.onBalanceUpdate(_balance);
        widget.onResetTotalBetAmount(); // reset the total bet amount to zero
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        // BoxDecoration takes the image
        decoration: const BoxDecoration(
          // Image set to background of the body
          image: DecorationImage(
            image: AssetImage("assets/images/blackjackbackground3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 90),
              Text('Click the button to deal 2 cards:'),
              ElevatedButton(
                onPressed: _dealCards,
                child: Text('Deal'),
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(10),
                  crossAxisCount: 2,
                  children: playerHand.map((card) {
                    return PlayingCardView(
                      card: card,
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(10),
                  crossAxisCount: 2,
                  children: dealerHand.map((card) {
                    return PlayingCardView(
                      card: card,
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bank: \$$_balance',
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 70),
                  Text('In: \$$_totalBetAmount',
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold)),
                ],
              ),

              ElevatedButton(
                onPressed: _hit,
                child: Text('Hit'),
              ),
              ElevatedButton(
                child: const Text('Win!'),
                onPressed: () {
                  widget.onWin(_totalBetAmount * 2); // Multiply the total bet amount by 2
                  if (_totalBetAmount > 0) {
                    _updateBalance(_totalBetAmount * 2); // Multiply the total bet amount by 2 to update balance
                    _resetTotalBetAmount();
                  }
                },
              ),
              ElevatedButton(
                child: const Text('Lose'),
                onPressed: () {
                  _loseBetAmount();
                },
              ),
              ElevatedButton(
                  child: const Text('Go back'),
                  onPressed: () {
                    Navigator.pop(context); //pop the second page of the stack
                  }), //Button//Button
            ],
          ),
        ), //Column)
      ),
    ); //Center
  } //scaffold
}
