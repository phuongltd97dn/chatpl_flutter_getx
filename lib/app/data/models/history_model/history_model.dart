class HistoryModel {
  String? question;
  String? answer;
  int? timestamp;
  bool isSelected;

  HistoryModel({
    this.question,
    this.answer,
    this.timestamp,
    this.isSelected = false,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        question: json['question'] as String?,
        answer: json['answer'] as String?,
        timestamp: json['timestamp'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'question': question,
        'answer': answer,
        'timestamp': timestamp,
        'isSelected': isSelected,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! HistoryModel) return false;
    return other.question == question && other.answer == answer;
  }
}
