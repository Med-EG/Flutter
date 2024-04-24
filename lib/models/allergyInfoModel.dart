class AllergyInfoModel {
  final String allergyType;
  final int allergyId;
  final String allergyName;
  final String? severityLevel;
  final String? bodyResponse;
  AllergyInfoModel(
      {required this.allergyId,
      required this.allergyType,
      required this.allergyName,
      this.severityLevel,
      this.bodyResponse});

  factory AllergyInfoModel.fromJson(json) {
    return AllergyInfoModel(
      allergyId: json['id'],
      allergyType: json['allergy_type'],
      severityLevel: json['severity_level'],
      bodyResponse: json['body_response'],
      allergyName: json['allergy_name'],
    );
  }
}
