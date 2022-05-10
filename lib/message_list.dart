import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text('Ahmed Hesham'),
              accountEmail: Text('heshama793@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/57070673?v=4'),
              ),
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.inbox,
              ),
              title: Text('Inbox'),
              trailing: Chip(
                label: Text('10'),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text(widget.title!), actions: [
        IconButton(
          icon: const Icon(
            Icons.refresh,
          ),
          onPressed: () {
            setState(
              () {
                messages = Message.loadMesageList();
              },
            );
          },
        ),
      ]),
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
                          backgroundColor: Colors.amber,
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
          }),
      floatingActionButton: const ComposeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// latency is the delay between u reauest smth and get it
