import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:message_client/message_details.dart';

import 'message.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key, this.title, this.status}) : super(key: key);
  final String? title;
  final String? status;
  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>>? messages;
  @override
  void initState() {
    messages = Message.loadMesageList(status: widget.status);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Message>>(
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
            if (snapshot.hasError || !snapshot.hasData) {
              kDebugMode
                  ? print('there is an err ${snapshot.error}')
                  : Text(
                      snapshot.error.toString(),
                    );
            }
            print(messages);
            List<Message> _messages = snapshot.data as List<Message>;

            return ListView.separated(
              itemBuilder: (context, index) {
                // create golbal keys for each list-tile
                // GlobalKey _key = GlobalKey();
                Message message = _messages[index];
                return Slidable(
                  key: UniqueKey(),
                  // The start action pane is the one at the left or the top side.
                  startActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: const ScrollMotion(),

                    // A pane can dismiss the Slidable.
                    dismissible: DismissiblePane(onDismissed: () {
                      print('message removed');
                      setState(() {
                        _messages.removeAt(index);
                      });
                    }),

                    // All actions are defined in the children parameter.
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                        onPressed: (_) {
                          print('message removed');
                          setState(() {
                            _messages.removeAt(index);
                          });
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (_) {},
                        backgroundColor: const Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.share,
                        label: 'Share',
                      ),
                    ],
                  ),
                  // The end action pane is the one at the right or the bottom side.
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        flex: 2,
                        onPressed: (_) {},
                        backgroundColor: const Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                        label: 'Archive',
                      ),
                      SlidableAction(
                        onPressed: (_) {},
                        backgroundColor: const Color(0xFF0392CF),
                        foregroundColor: Colors.white,
                        icon: Icons.save,
                        label: 'Save',
                      ),
                    ],
                  ),
                  child: ListTile(
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
                      // backgroundColor: Colors.amber,
                      child: Text('AH'),
                    ),
                    title: Text(message.subject!),
                    subtitle: Text(
                      message.body!,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) => const Divider(),
              itemCount: _messages.length,
            );
        }
      },
    );
  }
}

// latency is the delay between u reauest smth and get it
