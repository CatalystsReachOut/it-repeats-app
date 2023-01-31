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
        id: json['ID'],
        departmentName: json['departmentName'],
        semester: json['semester'],
        subjectName: json['subjectName'],
        examName: json['examName'],
        fileURL: json['fileURL'],
        year: json['year']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['departmentName'] = departmentName;
    data['semester'] = semester;
    data['subjectName'] = subjectName;
    data['examName'] = examName;
    data['fileURL'] = fileURL;
    data['year'] = year;
    data['ID'] = id;
    return data;
  }
}
