import 'package:chat_pl/app/data/models/message_model/message.dart';

class Choice {
  int? index;
  Message? message;
  String? finishReason;

  Choice({
    this.index,
    this.message,
    this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
      index: json['index'] as int?,
      message:
          json['message'] != null ? Message.fromJson(json['message']) : null,
      finishReason: json['finish_reason']);

  Map<String, dynamic> toJson() => {
        'index': index,
        'message': message?.toJson(),
        'finishReason': finishReason,
      };
}
