import 'package:flutter/material.dart';

class MessageDetails extends StatelessWidget {
  const MessageDetails({Key? key, required this.title, required this.body})
      : super(key: key);
  final String title, body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: Center(
        child: Text(
          body,
        ),
      ),
    );
  }
}
