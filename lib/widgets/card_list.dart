import 'package:cards/services/atm_card_store.dart';
import 'package:flutter/material.dart';
import 'atm_card.dart';

class CardList extends StatefulWidget {
  final ATMCardStoreService _cardService = ATMCardStoreService();
  final List<ATMCardWidget> atmCardWidgetList =
      List<ATMCardWidget>.empty(growable: true);

  CardList({Key? key}) : super(key: key) {
    var allCards = _cardService.getAllCards();
    for (var card in allCards) {
      atmCardWidgetList.add(ATMCardWidget(
        color: card.getCardbackGroundColor(),
        atmCard: card,
        textColor: card.getCardTextColor(),
      ));
    }
  }

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 2.0),
        child: Column(
          children: widget.atmCardWidgetList,
        ),
      ),
    );
  }
}
