class MessageRequest {
  String? model;
  List<dynamic>? messages;

  MessageRequest({this.model, this.messages});

  factory MessageRequest.fromJson(Map<String, dynamic> json) => MessageRequest(
        model: json['model'] as String?,
        messages: json['messages'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'model': model,
        'messages': messages,
      };
}
