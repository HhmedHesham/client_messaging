import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:message_client/compose_button.dart';
import 'package:message_client/message_details.dart';

import 'message.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>>? messages;
  @override
  void initState() {
    messages = Message.loadMesageList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        leading: IconButton(
          icon: const Icon(
            Icons.refresh,
          ),
          onPressed: () {
            setState(() {
              messages = Message.loadMesageList();
            });
          },
        ),
      ),
      body: FutureBuilder(
          future: messages,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  kDebugMode
                      ? print('there is an err ${snapshot.error}')
                      : Text(
                          snapshot.error.toString(),
                        );
                }
                List<Message> _messages = snapshot.data as List<Message>;
                return ListView.separated(
                  itemBuilder: (context, index) {
                    Message message = _messages[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MessageDetails(
                              body: message.body!,
                              title: message.subject!,
                            ),
                          ),
                        );
                      },
                      isThreeLine: true,
                      leading: const CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text('AH'),
                      ),
                      title: Text(message.subject!),
                      subtitle: Text(
                        message.body!,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) => const Divider(),
                  itemCount: _messages.length,
                );
            }
          }),
      floatingActionButton: const ComposeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// latency is the delay between u reauest smth and get it
