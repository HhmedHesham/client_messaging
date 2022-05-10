import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  const MessageCompose({Key? key}) : super(key: key);

  @override
  State<MessageCompose> createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String? to, body, subject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Compose'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: TextField(
                onChanged: (value) {
                  print(value);
                  to = value;
                },
                decoration: const InputDecoration(
                  label: Text(
                    'TO',
                  ),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            ListTile(
              title: TextField(
                onChanged: (value) => subject = value,
                decoration: const InputDecoration(
                  label: Text(
                    'Subject',
                  ),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Divider(),
            ListTile(
              title: TextField(
                onChanged: (value) => body = value,
                decoration: const InputDecoration(
                  label: Text(
                    'Body',
                  ),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                maxLines: 5,
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  print('to');
                  print(body);
                  print(subject);
                },
                child: const Text(
                  'send',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                print(to);
                print(body);
                print(subject);
              },
              child: const Text(
                'send',
              ),
            ),
            // Text(
            //   'Compose New Message',
            //   style: Theme.of(context).textTheme.titleLarge,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     TextButton(
            //       onPressed: () {
            //         Navigator.pop(context,'Love');
            //       },
            //       child: const Text(
            //         'Love',
            //       ),
            //       style: TextButton.styleFrom(backgroundColor: Colors.purple),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         Navigator.pop(context,'Hate');
            //       },
            //       child: const Text(
            //         'Hate',
            //       ),
            //       style: TextButton.styleFrom(backgroundColor: Colors.purple),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
