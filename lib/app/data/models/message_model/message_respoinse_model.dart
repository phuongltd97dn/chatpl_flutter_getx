import 'package:chat_pl/app/data/models/message_model/choice.dart';

class MessageResponse {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choice>? choices;

  MessageResponse({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      MessageResponse(
        id: json['id'] as String?,
        object: json['object'] as String?,
        created: json['created'] as int?,
        model: json['model'] as String?,
        choices: (json['choices'] as List<dynamic>?)
            ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'created': created,
        'model': model,
        'choices': choices,
      };
}
