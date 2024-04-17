// ignore_for_file: non_constant_identifier_names

class MedicalRecordModel {
  final int height;
  final int weight;
  final String blood_type;
  final bool alcoholic;
  final String alcoholic_level;
  final bool smoker;
  final String smoking_level;
  final String job;
  final String marital_status;
  final String? past_fracrues;
  final String? sleeping_hours;
  final String? sleeping_quality;
  final String father;
  final String mother;
  final String? second_degree;

  MedicalRecordModel(
      {
      required this.height,
      required this.weight,
      required this.blood_type,
      required this.alcoholic,
      required this.alcoholic_level,
      required this.smoker,
      required this.smoking_level,
      required this.job,
      required this.marital_status,
      this.past_fracrues,
      this.sleeping_hours,
      this.sleeping_quality,
      required this.father,
      required this.mother,
      this.second_degree});

  factory MedicalRecordModel.fromJson(json) {
    return MedicalRecordModel(
        height: json["height"],
        weight: json["weight"],
        blood_type: json["blood_type"],
        alcoholic: json["alcoholic"] == 1,
        alcoholic_level: json["alcoholic_level"],
        smoker: json["smoker"] == 1,
        smoking_level: json["smoking_level"],
        job: json["job"],
        marital_status: json["marital_status"],
        past_fracrues: json["past_fracrues"],
        sleeping_hours: json["sleeping_hours"],
        sleeping_quality: json["sleeping_quality"],
        father: json["father"],
        mother: json["mother"],
        second_degree: json["second_degree"]);
  }
}
