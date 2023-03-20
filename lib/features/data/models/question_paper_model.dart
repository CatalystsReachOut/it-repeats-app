import 'package:it_repeats/features/domain/entities/question_paper_entity.dart';

class QuestionPaperModel extends QuestionPaperEntity {
  const QuestionPaperModel({
    required String id,
    required String departmentName,
    required String semester,
    required String subjectName,
    required String examName,
    required String fileURL,
    required String year,
  }) : super(
            id: id,
            departmentName: departmentName,
            semester: semester,
            subjectName: subjectName,
            examName: examName,
            fileURL: fileURL,
            year: year);

  factory QuestionPaperModel.fromJson(Map<String, dynamic> json) {
    return QuestionPaperModel(
      id: json['data'][0]['id'],
      departmentName: json['data'][0]['data']['departmentName'],
      semester: json['data'][0]['data']['semester'],
      subjectName: json['data'][0]['data']['subjectName'],
      examName: json['data'][0]['data']['examName'],
      fileURL: json['data'][0]['data']['fileUrl'],
      year: json['data'][0]['data']['year'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['departmentName'] = departmentName;
    data['semester'] = semester;
    data['subjectName'] = subjectName;
    data['examName'] = examName;
    data['fileUrl'] = fileURL;
    data['year'] = year;
    data['id'] = id;
    return data;
  }
}
