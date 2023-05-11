// import 'package:flutter/material.dart';
// import 'main.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';
//
// class ThirdPage extends StatelessWidget //first page
//     {
//   const ThirdPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text(
//             "Options",
//             style: TextStyle(fontSize: 22.0),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.black),
//       body: DecoratedBox(
//         // BoxDecoration takes the image
//         decoration: const BoxDecoration(
//           // Image set to background of the body
//           image: DecorationImage(
//               image: AssetImage("assets/images/blackjackbackground3.png"),
//               fit: BoxFit.cover),
//         ),
//
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//               ),
//               const SizedBox(
//                 height: 100.0,
//               ),
//               Container(
//                 width: 120.0,
//                 height: 50.0,
//                 color: Colors.black,
//                 alignment: Alignment.center,
//
//                 child: const Text(
//                   "Sound",
//                   style: TextStyle(fontSize: 30.0, color: Colors.white),
//                 ),
//               ),
//               const SizedBox(
//                 height: 25.0,
//               ),
//               LiteRollingSwitch(
//                 value: true,
//                 textOn: "On",
//                 textOff: "Off",
//                 colorOn: Colors.black,
//                 colorOff: Colors.grey,
//                 iconOn: Icons.surround_sound,
//                 iconOff: Icons.surround_sound_outlined,
//                 textSize: 18.0,
//                 onChanged: (bool position) {
//                   print('turned ${(position) ? 'on' : 'off'}');
//                 },
//                 onTap: () {},
//                 onDoubleTap: () {},
//                 onSwipe: () {},
//               ),
//               const SizedBox(
//                 height: 25.0,
//               ),
//               Container(
//                 width: 120.0,
//                 height: 50.0,
//                 color: Colors.black,
//                 alignment: Alignment.center,
//                 child: const Text(
//                   "Music",
//                   style: TextStyle(
//                     fontSize: 30.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 25.0,
//               ),
//               LiteRollingSwitch(
//                 value: true,
//                 textOn: "On",
//                 textOff: "Off",
//                 colorOn: Colors.black,
//                 colorOff: Colors.grey,
//                 iconOn: Icons.music_note_rounded,
//                 iconOff: Icons.music_note_outlined,
//                 textSize: 18.0,
//                 onChanged: (bool position) {
//                   print('turned ${(position) ? 'on' : 'off'}');
//                 },
//                 onTap: () {},
//                 onDoubleTap: () {},
//                 onSwipe: () {},
//               ),
//               const SizedBox(
//                 height: 25.0,
//               ),
//               Container(
//                 width: 150.0,
//                 height: 50,
//                 color: Colors.black,
//                 alignment: Alignment.center,
//                 child: const Text(
//                   "Vibration",
//                   style: TextStyle(
//                     fontSize: 30.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 25.0,
//               ),
//               LiteRollingSwitch(
//                 value: true,
//                 textOn: "On",
//                 textOff: "Off",
//                 colorOn: Colors.black,
//                 colorOff: Colors.grey,
//                 iconOn: Icons.vibration_rounded,
//                 iconOff: Icons.vibration_rounded,
//                 textSize: 18.0,
//                 onChanged: (bool position) {
//                   print('turned ${(position) ? 'on' : 'off'}');
//                 },
//                 onTap: () {},
//                 onDoubleTap: () {},
//                 onSwipe: () {},
//               ),
//               const SizedBox(
//                 height: 25.0,
//               ),
//               SizedBox(
//                 width: 120,
//                 height: 50,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       aboutPopUp(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.white,
//                       textStyle: const TextStyle(
//                           fontSize: 25, fontWeight: FontWeight.bold),
//                       shape: const StadiumBorder(),
//                     ),
//                     child: const Text('Rules')),
//               ),
//             ],
//           ),
//         ), //Column)
//       ),
//     );
//   }
// }