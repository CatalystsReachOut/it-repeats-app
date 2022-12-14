import 'package:it_repeats/features/domain/entities/question_paper_entity.dart';

class QuestionPaperModel extends QuestionPaperEntity {
  QuestionPaperModel.fromJson(Map<String, dynamic> json) {
    departmentName = json['departmentName'];
    semester = json['semester'];
    subjectName = json['subjectName'];
    examName = json['examName'];
    fileURL = json['fileURL'];
    year = json['year'];
    id = json['ID'];
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
