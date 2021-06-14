import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  final String text;

  MessagePage({this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message_rounded,
              size: 100,
              color: Theme.of(context).primaryColor,
            ),
            Text(
              '$text',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
