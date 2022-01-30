import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ATMCard {
  Uuid cardId = const Uuid();
  String bankName;
  String cardNumber;
  String expDate;
  String cvv;
  String cardHolder;
  ATMCardType atmCardType;

  ATMCard(
      {required this.cardNumber,
      required this.expDate,
      required this.cvv,
      required this.cardHolder,
      required this.bankName,
      required this.atmCardType});

  Color getCardTextColor() {
    switch (atmCardType) {
      case ATMCardType.debit:
        return Colors.black;
      case ATMCardType.credit:
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  Color getCardbackGroundColor() {
    switch (atmCardType) {
      case ATMCardType.debit:
        return Colors.white;
      case ATMCardType.credit:
        return Colors.black;
      default:
        return Colors.red.shade800;
    }
  }

  static ATMCard getNewCard() {
    return ATMCard(
      cardNumber: "",
      expDate: "",
      cvv: "",
      cardHolder: "",
      bankName: '',
      atmCardType: ATMCardType.none,
    );
  }
}

enum ATMCardType {
  none,
  credit,
  debit,
}
