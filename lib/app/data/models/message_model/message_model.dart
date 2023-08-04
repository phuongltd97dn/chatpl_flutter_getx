class MessageModel {
  final String? msg;
  final bool? isUser;
  final int? timestamp;

  MessageModel({this.msg, this.isUser, this.timestamp});

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        msg: json['msg'] as String?,
        isUser: json['isUser'] as bool?,
        timestamp: json['timestamp'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'isUser': isUser,
        'timestamp': timestamp,
      };
}
