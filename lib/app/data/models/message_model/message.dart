class Message {
  String? role;
  String? content;

  Message({this.role, this.content});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json['role'] as String?,
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'role': role,
        'content': content,
      };
}
