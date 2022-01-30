import 'package:cards/models/atm_card.dart';
import 'package:uuid/uuid.dart';

class ATMCardStoreService {
  // find a better state management
  static List<ATMCard> _cards = List<ATMCard>.empty();

  List<ATMCard> getAllCards() {
    return _cards;
  }

  ATMCardStoreService() {
    _cards = _fetchCardsFromStorage();
  }

  ATMCard getCardFromStore(Uuid cardId) {
    return _cards.singleWhere((card) => card.cardId == cardId);
  }

  void addCardToStore(ATMCard card) {
    _cards.add(card);
    _saveCardsToStorage();
  }

  // save back to whereever its fetch from
  void _saveCardsToStorage() {}

  // ideally fetch from shared prefs or something similar
  List<ATMCard> _fetchCardsFromStorage() {
    return [
      ATMCard(
        cardNumber: "3546 7532 XXXX 9742",
        expDate: "08/2022",
        cvv: "455",
        cardHolder: "HOUSSEM SELMI",
        bankName: "Axis Bank",
        atmCardType: ATMCardType.debit,
      ),
      ATMCard(
        cardNumber: "3546 7532 XXXX 9742",
        expDate: "08/2022",
        cvv: "455",
        cardHolder: "HOUSSEM SELMI",
        bankName: "Axis Bank",
        atmCardType: ATMCardType.credit,
      ),
      ATMCard(
        cardNumber: "3546 7532 XXXX 9742",
        expDate: "08/2022",
        cvv: "455",
        cardHolder: "HOUSSEM SELMI",
        bankName: "Axis Bank",
        atmCardType: ATMCardType.credit,
      ),
      ATMCard(
        cardNumber: "3546 7532 XXXX 9742",
        expDate: "08/2022",
        cvv: "455",
        cardHolder: "HOUSSEM SELMI",
        bankName: "Axis Bank",
        atmCardType: ATMCardType.credit,
      ),
      ATMCard(
        cardNumber: "3546 7532 XXXX 9742",
        expDate: "08/2022",
        cvv: "455",
        cardHolder: "HOUSSEM SELMI",
        bankName: "Axis Bank",
        atmCardType: ATMCardType.debit,
      ),
    ];
  }
}
