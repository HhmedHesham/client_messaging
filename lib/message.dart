import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    final String? subject,
    final String? body,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  // read the file and display the message
  static Future<List<Message>>? loadMesageList({String? status}) async {
    // // to load file as a string, take a weeks to the disk seek
    // String content = await rootBundle.loadString('data/message.json');
    String url = status == 'Important'
        ? 'https://run.mocky.io/v3/529ec6bc-bd7b-4ebe-a9d1-b1fa988dd184'
        : 'https://run.mocky.io/v3/ddf66714-36a9-49b6-8b60-b19a7fd3651c';
    // load the string from remote locaation:
    final response = await http.get(Uri.parse(url));
    print(response.body);
    print('messsssssage');

    // await Future.delayed(
    //   const Duration(milliseconds: 3000),
    // );
    List collection = jsonDecode(response
        .body); // decoding string to a dart data structures ' list of maps '
    print(collection);
    List<Message> _messages = collection
        .map((json) => Message.fromJson(json))
        .toList(); // using .map so I will iterate on each item in the list and making a model by fromJson which takes the map
    print('messsssssage');
    print(_messages);
    print('messsssssage');

    return _messages;
  }
}
