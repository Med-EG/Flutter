class WorkingDaysModel {
  final int doctorID;
  final String day;

  WorkingDaysModel({required this.doctorID, required this.day});

  factory WorkingDaysModel.fromJson(json) {
    return WorkingDaysModel(
        doctorID: json['doctor_id'], day: json['day_of_week']);
  }
}
