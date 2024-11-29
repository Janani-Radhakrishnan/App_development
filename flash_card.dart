import 'package:flutter/material.dart';

class FlashCard extends StatelessWidget {
  FlashCard({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        elevation: 17,
        shadowColor: Color.fromARGB(255, 2, 75, 6),
        color: Colors.green[700],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child:
                Text(text, style: TextStyle(fontSize: 15, letterSpacing: 1.0,fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}