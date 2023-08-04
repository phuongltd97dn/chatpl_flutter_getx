class SampleQuestionModel {
  String? category;
  List<String>? questions;

  SampleQuestionModel({this.category, this.questions});

  factory SampleQuestionModel.fromJson(Map<String, dynamic> json) =>
      SampleQuestionModel(
        category: json['category'] as String?,
        questions: json['questions'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'questions': questions,
      };
}
