class DiseaseInfoModel {
  final int diseaseId;
  final String diseaseName;
  final String? notes;
  DiseaseInfoModel({
    required this.diseaseId,
    required this.diseaseName,
    this.notes,
  });

  factory DiseaseInfoModel.fromJson(json) {
    return DiseaseInfoModel(
        diseaseId: json['id'],
        diseaseName: json['disease_name'],

        notes: json['notes']);
  }
}
