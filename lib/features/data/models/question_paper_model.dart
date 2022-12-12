class QuestionPaperModel {
  late final String? departmentName;
  late final String? semester;
  late final String? subjectName;
  late final String? examName;
  late final String? fileURL;
  late final String? year;
  late final String? uploaderName;
  late final String? uploadDate;
  late final String? iD;

  QuestionPaperModel(
      {this.departmentName,
      this.semester,
      this.subjectName,
      this.examName,
      this.fileURL,
      this.year,
      this.uploaderName,
      this.uploadDate,
      this.iD});

  QuestionPaperModel.fromJson(Map<String, dynamic> json) {
    departmentName = json['departmentName'];
    semester = json['semester'];
    subjectName = json['subjectName'];
    examName = json['examName'];
    fileURL = json['fileURL'];
    year = json['year'];
    uploaderName = json['uploaderName'];
    uploadDate = json['uploadDate'];
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['departmentName'] = departmentName;
    data['semester'] = semester;
    data['subjectName'] = subjectName;
    data['examName'] = examName;
    data['fileURL'] = fileURL;
    data['year'] = year;
    data['uploaderName'] = uploaderName;
    data['uploadDate'] = uploadDate;
    data['ID'] = iD;
    return data;
  }
}
