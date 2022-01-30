import 'package:cards/Codesets/atm_card_codes.dart';
import 'package:cards/models/atm_card.dart';
import 'package:cards/services/atm_card_store.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ATMCardDetailsWidget extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  ATMCard _atmCard = ATMCard.getNewCard();
  final _atmCardStoreService = ATMCardStoreService();

  ATMCardDetailsWidget({
    Key? key,
    ATMCard? atmCard,
  }) : super(key: key) {
    // add new card
    _atmCard = atmCard ?? _atmCard;
  }
  @override
  _ATMCardDetailsWidgetState createState() => _ATMCardDetailsWidgetState();
}

class _ATMCardDetailsWidgetState extends State<ATMCardDetailsWidget> {
  String _dropDownValue = ATMCardCodes.debit;

  // List of items in our dropdown menu
  final _dropDownItems = [
    ATMCardCodes.debit,
    ATMCardCodes.credit,
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Details"),
          centerTitle: false,
        ),
        backgroundColor: Colors.grey[150],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(top: 5, bottom: 5),
                //   child: ATMCardWidget(
                //     color: Colors.white, //Color(0xFF090943),
                //     atmCard: widget._atmCard,
                //     textColor: Colors.black,
                //   ),
                // ),
                // Divider(
                //   endIndent: 10,
                //   indent: 10,
                //   thickness: 5,
                //   height: 10,
                //   color: Colors.grey[250],
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 26.0, 8.0, 8.0),
                  child: Form(
                    key: widget._formKey,
                    child: Column(
                      children: [
                        inpBox(
                          label: ATMCardCodes.bankName,
                          textInputType: TextInputType.number,
                          onSave: (String value) => {
                            widget._atmCard.cardNumber = value,
                          },
                          oldValue: widget._atmCard.bankName,
                        ),
                        const SizedBox(height: 20.0),
                        inpBox(
                          label: ATMCardCodes.cardNumber,
                          textInputType: TextInputType.number,
                          onSave: (String value) => {
                            widget._atmCard.cardNumber = value,
                          },
                          oldValue: widget._atmCard.cardNumber,
                        ),
                        const SizedBox(height: 20.0),
                        inpBox(
                          label: ATMCardCodes.expDate,
                          textInputType: TextInputType.number,
                          onSave: (String value) => {
                            widget._atmCard.expDate = value,
                          },
                          oldValue: widget._atmCard.expDate,
                        ),
                        const SizedBox(height: 20.0),
                        inpBox(
                          label: ATMCardCodes.cvv,
                          textInputType: TextInputType.number,
                          onSave: (String value) => {
                            widget._atmCard.cvv = value,
                          },
                          oldValue: widget._atmCard.cvv,
                        ),
                        const SizedBox(height: 20.0),
                        inpBox(
                          label: ATMCardCodes.cardHolder,
                          textInputType: TextInputType.name,
                          onSave: (String value) => {
                            widget._atmCard.cardHolder = value,
                          },
                          oldValue: widget._atmCard.cardHolder,
                        ),
                        const SizedBox(height: 20.0),
                        StatefulBuilder(
                          builder: (context, setState) {
                            return _cardTypeDropdown(setState);
                            // DropdownButton(
                            //   // Initial Value
                            //   value: dropdownvalue,
                            //   icon: const Icon(Icons.keyboard_arrow_down),
                            //   items: items.map((String items) {
                            //     return DropdownMenuItem(
                            //       value: items,
                            //       child: Text(items),
                            //     );
                            //   }).toList(),
                            //   onChanged: (String? newValue) {
                            //     setState(() {
                            //       dropdownvalue = newValue!;
                            //       if (dropdownvalue == ATMCardCodes.credit) {
                            //         widget._atmCard.atmCardType =
                            //             ATMCardType.credit;
                            //       } else {
                            //         widget._atmCard.atmCardType =
                            //             ATMCardType.debit;
                            //       }
                            //     });
                            //   },
                            // );
                          },
                        ),
                        _addButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // final _currencies = [
  //   "Food",
  //   "Transport",
  //   "Personal",
  //   "Shopping",
  //   "Medical",
  //   "Rent",
  //   "Movie",
  //   "Salary"
  // ];
  // String _currentSelectedValue = "";
  Widget _cardTypeDropdown(Function setState) {
    return InputDecorator(
      decoration: InputDecoration(
          // labelStyle: textStyle,
          errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 16.0),
          hintText: 'Please select expense',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      // isEmpty: _currentSelectedValue == '',
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _dropDownValue,
          isDense: true,
          onChanged: (String? newValue) {
            setState(() {
              _dropDownValue = newValue!;
              if (_dropDownValue == ATMCardCodes.credit) {
                widget._atmCard.atmCardType = ATMCardType.credit;
              } else {
                widget._atmCard.atmCardType = ATMCardType.debit;
              }
              // state.didChange(newValue);
            });
          },
          items: _dropDownItems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _addButton() {
    return Container(
        padding: const EdgeInsets.fromLTRB(120.0, 0.0, 120.0, 0.0),
        height: 40.0,
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            if (widget._formKey.currentState?.validate() ?? false) {
              widget._formKey.currentState?.save();
              widget._atmCardStoreService.addCardToStore(widget._atmCard);
            }
          },
          child: const Text('Add'),
        ));
  }

  Widget inpBox(
      {String label = "label",
      required TextInputType textInputType,
      String? oldValue,
      required Function onSave}) {
    final controller = TextEditingController();

    oldValue = oldValue?.trim();
    if (oldValue != null && oldValue != "") controller.text = oldValue;

    return Column(
      children: [
        TextFormField(
          keyboardType: textInputType,
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.black,
            border: const OutlineInputBorder(),
            labelText: label,
          ),
          onChanged: (text) => widget._formKey.currentState?.validate(),
          onSaved: (String? value) => onSave(value),
        ),
      ],
    );
  }
}
