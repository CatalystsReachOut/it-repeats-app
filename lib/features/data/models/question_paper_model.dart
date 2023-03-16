import 'package:it_repeats/features/domain/entities/question_paper_entity.dart';

class QuestionPaperModel extends QuestionPaperEntity {
  const QuestionPaperModel({
    required String id,
    required String departmentName,
    required String semester,
    required String subjectName,
    required String examName,
    required String fileURL,
    required int year,
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
        departmentName: json['data'][0]['departmentName'],
        semester: json['data'][0]['semester'],
        subjectName: json['data'][0]['subjectName'],
        examName: json['data'][0]['examName'],
        fileURL: json['data'][0]['fileUrl'],
        year: json['data'][0]['year']);
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
