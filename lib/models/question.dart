import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first



class QuestionDataModel {
  final String id;
  final String question;
  final List<String> answers;
  final String correctAnswer;
  QuestionDataModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  QuestionDataModel copyWith({
    String? id,
    String? question,
    List<String>? answers,
    String? correctAnswer,
  }) {
    return QuestionDataModel(
      id: id ?? this.id,
      question: question ?? this.question,
      answers: answers ?? this.answers,
      correctAnswer: correctAnswer ?? this.correctAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'question': question});
    result.addAll({'answers': answers});
    result.addAll({'correctAnswer': correctAnswer});
  
    return result;
  }

  factory QuestionDataModel.fromMap(Map<String, dynamic> map) {
    return QuestionDataModel(
      id: map['id'] ?? '',
      question: map['question'] ?? '',
      answers: List<String>.from(map['answers']),
      correctAnswer: map['correctAnswer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionDataModel.fromJson(String source) => QuestionDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuestionDataModel(id: $id, question: $question, answers: $answers, correctAnswer: $correctAnswer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QuestionDataModel &&
      other.id == id &&
      other.question == question &&
      listEquals(other.answers, answers) &&
      other.correctAnswer == correctAnswer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      question.hashCode ^
      answers.hashCode ^
      correctAnswer.hashCode;
  }
}

List<QuestionDataModel> questionObjects=[
 
  QuestionDataModel(id: '1', question: 'what is question', answers: [
    '1','2','3','4'
  ], correctAnswer: '2'),
  QuestionDataModel(id: '2', question: 'what 2 is question', answers: [
    '1','2','3','4'
  ], correctAnswer: '1'),
   QuestionDataModel(id: '2', question: 'what 3rd question', answers: [
    '1','2','3','4'
  ], correctAnswer: '4'),
];
