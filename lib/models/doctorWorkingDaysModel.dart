class WorkingDaysModel {
  final int doctorID;
  final int workDayID;
  final String day;

  WorkingDaysModel({required this.doctorID, required this.day, required this.workDayID});

  factory WorkingDaysModel.fromJson(json) {
    return WorkingDaysModel(
        doctorID: json['doctor_id'], 
        day: json['day_of_week'],
        workDayID: json['working_day_id']
        );
  }
}
