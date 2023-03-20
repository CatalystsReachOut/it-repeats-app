import 'package:equatable/equatable.dart';

class QuestionPaperEntity extends Equatable {
  final String? id;
  final String? departmentName;
  final String? semester;
  final String? subjectName;
  final String? examName;
  final String fileURL;
  final String? year;

  const QuestionPaperEntity({
    required this.id,
    required this.departmentName,
    required this.semester,
    required this.subjectName,
    required this.examName,
    required this.fileURL,
    required this.year,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, departmentName, semester, subjectName, examName, fileURL, year];
}
