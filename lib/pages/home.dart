import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../widgets/card_list.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Cards"),
          centerTitle: false,
        ),
        backgroundColor: Colors.grey[350],
        body: SafeArea(child: CardList()),
        floatingActionButton: SpeedDial(
            icon: Icons.add,
            backgroundColor: Colors.grey[850],
            children: [
              SpeedDialChild(
                child: const Icon(Icons.credit_card),
                label: 'Photo',
                backgroundColor: Colors.amberAccent,
                onTap: () {/* Do someting */},
              ),
              SpeedDialChild(
                child: const Icon(Icons.keyboard_alt),
                label: 'Enter',
                backgroundColor: Colors.amberAccent,
                onTap: () {/* Do something */},
              ),
            ]),
      ),
    );
  }
}
