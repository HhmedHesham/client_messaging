import 'package:flutter/material.dart';

import 'message_compose.dart';

class ComposeButton extends StatelessWidget {
  const ComposeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        String intention = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const MessageCompose(),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Your message has been sent with $intention'),
            // backgroundColor: Colors.purple,
          ),
        );
      },
    );
  }
}
