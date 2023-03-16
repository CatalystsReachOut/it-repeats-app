import 'dart:convert';
import 'package:it_repeats/core/error/exceptions.dart';

import '../models/question_paper_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<QuestionPaperModel> fetchQuestionPaper(
      String departmentName, String semester, String subject, String year);

  Future<void> viewQuestionPaper(String fileURL);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<QuestionPaperModel> fetchQuestionPaper(String departmentName,
      String semester, String subject, String year) async {
    final response = await client.get(
      Uri.parse(
          'https://itrepeats-backend-2p5h.vercel.app/api/question-paper/get-sub?departmentName=$departmentName&semester=$semester&subjectName=$subject&year=$year'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return QuestionPaperModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> viewQuestionPaper(String fileURL) {
    // TODO: implement viewQuestionPaper
    throw UnimplementedError();
  }
}
