import 'package:cards/models/atm_card.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class ATMCardWidget extends StatefulWidget {
  final Color color;
  final Color textColor;
  final ATMCard atmCard;

  const ATMCardWidget({
    Key? key,
    required this.color,
    this.textColor = Colors.white,
    required this.atmCard,
  }) : super(key: key);

  @override
  _ATMCardWidgetState createState() => _ATMCardWidgetState();

  toList() {}
}

class _ATMCardWidgetState extends State<ATMCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 20,
      color: widget.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        splashColor: Colors.grey.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: Container(
          height: 200,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildLogosBlock(
                fontColor: widget.textColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDetailsBlock(
                      label: 'CARD NUMBER',
                      value: widget.atmCard.cardNumber,
                      textColor: widget.textColor,
                    ),
                    _buildDetailsBlock(
                      label: "CVV",
                      value: widget.atmCard.cvv,
                      textColor: widget.textColor,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildDetailsBlock(
                    label: 'CARD HOLDER',
                    value: widget.atmCard.cardHolder,
                    textColor: widget.textColor,
                  ),
                  _buildDetailsBlock(
                    label: 'VALID THRU',
                    value: widget.atmCard.expDate,
                    textColor: widget.textColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build the top row containing logos
  Row _buildLogosBlock({required Color fontColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          widget.atmCard.bankName,
          style: TextStyle(
            fontSize: 22.5,
            color: fontColor,
          ),
        ),
        // Image.asset(
        //   "assets/images/contact_less.png",
        //   height: 20,
        //   width: 18,
        // ),
        Image.asset(
          "assets/images/master_card.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

  // Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock(
      {required String label,
      required String value,
      required Color textColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(
              color: textColor, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
