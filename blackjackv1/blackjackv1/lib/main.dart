import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget //myApp
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'This is our app',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget //first page
{
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        // BoxDecoration takes the image
        decoration: const BoxDecoration(
          // Image set to background of the body
          image: DecorationImage(
              image: AssetImage("assets/images/blackjackbackground3.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            // decoration: const InputDecoration(labelText: 'Title'),
            //onChanged: (value) => value
            children: [
              const SizedBox(height: 80),
              Image.asset('assets/images/blackjack4.png', fit: BoxFit.contain),
              const SizedBox(height: 20),
              SizedBox(
                width: 135,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SecondPage()), //inputs string into constructor
                      ); //push as SecondPage on top of stack
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Play')),
              ),
              //Button
              const SizedBox(height: 23),
              SizedBox(
                width: 132,
                height: 47,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ThirdPage()), //inputs string into constructor
                      ); //push as SecondPage on top of stack
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Options')),
              ),
              const SizedBox(height: 23),
              SizedBox(
                width: 88,
                height: 40,
                child: ElevatedButton(
                    onPressed: () => exit(0),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Quit')),
              ),
            ],
          ),
        ),
      ),
    ); //Column)
    //Center
  } //scaffold
} //first page

class SecondPage extends StatelessWidget //first page
{
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        // BoxDecoration takes the image
        decoration: const BoxDecoration(
          // Image set to background of the body
          image: DecorationImage(
              image: AssetImage("assets/images/blackjackbackground3.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10), //SizedBox

              ElevatedButton(
                  child: const Text('2nd page, Go back'),
                  onPressed: () {
                    Navigator.pop(context); //pop the second page of the stack
                  }), //Button
            ],
          ),
        ), //Column)
      ),
    ); //Center
  } //scaffold
} //second page

class ThirdPage extends StatelessWidget //first page
{
  const ThirdPage({super.key});
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
      body: DecoratedBox(
        // BoxDecoration takes the image
        decoration: const BoxDecoration(
          // Image set to background of the body
          image: DecorationImage(
              image: AssetImage("assets/images/blackjackbackground3.png"),
              fit: BoxFit.cover),
        ),

        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const SizedBox(
                height: 100.0,
              ),
              Container(
                width: 120.0,
                height: 50.0,
                color: Colors.black,
                alignment: Alignment.center,
                child: const Text(
                  "Sound",
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              LiteRollingSwitch(
                value: true,
                textOn: "On",
                textOff: "Off",
                colorOn: Colors.black,
                colorOff: Colors.grey,
                iconOn: Icons.surround_sound,
                iconOff: Icons.surround_sound_outlined,
                textSize: 18.0,
                onChanged: (bool position) {
                  print('turned ${(position) ? 'on' : 'off'}');
                },
                onTap: () {},
                onDoubleTap: () {},
                onSwipe: () {},
              ),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                width: 120.0,
                height: 50.0,
                color: Colors.black,
                alignment: Alignment.center,
                child: const Text(
                  "Music",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              LiteRollingSwitch(
                value: true,
                textOn: "On",
                textOff: "Off",
                colorOn: Colors.black,
                colorOff: Colors.grey,
                iconOn: Icons.music_note_rounded,
                iconOff: Icons.music_note_outlined,
                textSize: 18.0,
                onChanged: (bool position) {
                  print('turned ${(position) ? 'on' : 'off'}');
                },
                onTap: () {},
                onDoubleTap: () {},
                onSwipe: () {},
              ),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                width: 150.0,
                height: 50,
                color: Colors.black,
                alignment: Alignment.center,
                child: const Text(
                  "Vibration",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              LiteRollingSwitch(
                value: true,
                textOn: "On",
                textOff: "Off",
                colorOn: Colors.black,
                colorOff: Colors.grey,
                iconOn: Icons.vibration_rounded,
                iconOff: Icons.vibration_rounded,
                textSize: 18.0,
                onChanged: (bool position) {
                  print('turned ${(position) ? 'on' : 'off'}');
                },
                onTap: () {},
                onDoubleTap: () {},
                onSwipe: () {},
              ),
              const SizedBox(
                height: 25.0,
              ),
              SizedBox(
                width: 120,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      aboutPopUp(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Rules')),
              ),
            ],
          ),
        ), //Column)
      ),
    );

    //Center
  }

  aboutPopUp(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            title: const Text(
              "What is Blackjack?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black,
            content: Container(
              decoration: const BoxDecoration(color: Colors.black),
              height: 540,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Blackjack, also known as twenty-one, is a popular casino card game that involves a player trying to beat the dealer by having a hand value of 21 or as close to 21 as possible without going over. Each card has a value of either its number or 10 for face cards and an Ace can be worth 1 or 11 depending on the player's choice."
                        "The game typically involves one or more decks of standard playing cards and can be played with a single player or a group of players competing against the dealer. Each player is dealt two cards face up and the dealer is dealt one card face up and one card face down."
                        "Players can choose to 'hit' or receive another card to try and improve their hand value, or 'stand' if they are satisfied with their current hand. Players can also choose to 'double down' by doubling their bet and receiving one more card or 'split' by separating their initial two cards into two separate hands."
                        "If a player's hand exceeds 21, they 'bust' and automatically lose the round. The dealer must follow specific rules for hitting or standing, usually requiring the dealer to hit until they have a hand value of 17 or greater. The player with the highest hand value without busting or the dealer going over 21 wins the round.",
                        style: TextStyle(
                            fontSize: 14.8,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  } //scaffold
} //second page
