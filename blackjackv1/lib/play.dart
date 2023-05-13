import 'package:flutter/material.dart';
import 'dealer.dart';
import 'service.dart';
import 'chipbet.dart';
import 'package:playing_cards/playing_cards.dart';


const HIGHES_SCORE_VALUE = 21;
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

  int dealerAction(){
    int dealerScore = mapCardValueRules(dealerHand);
    int dealerCards = dealerHand.length;
    print("Dealer card in hand: $dealerCards");
    if(dealerScore <= 11) {
      print("Dealer card in hand: $dealerCards");
      dealerHand.addAll(dealerService.drawCards(1));
      dealerScore = mapCardValueRules(dealerHand);
    }
    if (dealerScore <= 15){
      print("Dealer card in hand: $dealerCards");
      dealerHand.addAll(dealerService.drawCards(1));
      dealerScore = mapCardValueRules(dealerHand);
    }

    return dealerScore;
  }


  void _hit() {
    setState(() {
      playerHand.addAll(dealerService.drawCards(1));
    });
  }

  void gameStatue(int player, int dealer){
    if(player > 21){
      print("Lose");
    }else if (dealer > 21){
      print("Win");
    }else{
      if(player == dealer){
        print("Draw");
      }else if(player > dealer){
        print("Player Win");
      }else {
        print("Dealer win");
      }
    }


  }
  void _double(){
    setState(() {
      print("Double HIt");
      int playerScore = mapCardValueRules(playerHand);
      int lengthPlayerHand = playerHand.length;
      if( playerScore < 21 && lengthPlayerHand == 2){
          playerHand.addAll(dealerService.drawCards(1));
          _totalBetAmount = _totalBetAmount * 2;
          playerScore = mapCardValueRules(playerHand);
          int dealerScore = dealerAction();
          print("playerScore : $playerScore");
          print("DealerScore : $dealerScore");
          gameStatue(playerScore, dealerScore);
          // if(playerScore > 21){
          //   print("lose");
          //
          // }
      }
    });
  }

  int mapStandardCardValue(int cardEnumIdex) {
    // ignore: constant_identifier_names
    const GAP_BETWEEN_INDEX_AND_VALUE = 2;

    // Card value 2-10 -> index between 0 and 8
    if (0 <= cardEnumIdex && cardEnumIdex <= 8) {
      return cardEnumIdex + GAP_BETWEEN_INDEX_AND_VALUE;
    }

    // Card is jack, queen, king -> index between90 and 11
    if (9 <= cardEnumIdex && cardEnumIdex <= 11) {
      return 10;
    }

    return 0;
  }

  int getSumOfStandardCards(List<PlayingCard> standardCards) {
    return standardCards.fold<int>(
        0, (sum, card) => sum + mapStandardCardValue(card.value.index));
  }
  int mapCardValueRules(List<PlayingCard> cards) {
    List<PlayingCard> standardCards = cards
        .where((card) => (0 <= card.value.index && card.value.index <= 11))
        .toList();

    final sumStandardCards = getSumOfStandardCards(standardCards);

    int acesAmount = cards.length - standardCards.length;
    if (acesAmount == 0) {
      return sumStandardCards;
    }

    // Special case: Ace could be value 1 or 11
    final pointsLeft = HIGHES_SCORE_VALUE - sumStandardCards;
    final oneAceIsEleven = 11 + (acesAmount - 1);

    // One Ace with value 11 fits
    if (pointsLeft >= oneAceIsEleven) {
      return sumStandardCards + oneAceIsEleven;
    }

    return sumStandardCards + acesAmount;
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
                  onPressed: _double,
                  child: Text("Double")
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
              // ElevatedButton(
              //     child: const Text('Go back'),
              //     onPressed: () {
              //       Navigator.pop(context); //pop the second page of the stack
              //     }), //Button//Button
            ],
          ),
        ), //Column)
      ),
    ); //Center
  } //scaffold
}
