// TODO: Add entities for a question paper with attributes

class QuestionPaperEntity {
  final int? id;
  final String? departmentName;
  final String? semester;
  final String? subjectName;
  final String? examName;
  final String? fileURL;
  final int? year;
  final String? uploaderName;
  final String? uploadDate;

  QuestionPaperEntity(
      {this.id,
        this.departmentName,
      this.semester,
      this.subjectName,
      this.examName,
      this.fileURL,
        this.year,
      this.uploaderName,
      this.uploadDate});
}
