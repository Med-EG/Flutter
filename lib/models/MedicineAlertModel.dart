class MedicineAlertModel {
  final String medicineName;
  final int dose;
  final int alertID;
  final List<AlertTimeModel> alertTimes;

  MedicineAlertModel(
      {required this.alertTimes,
      required this.alertID,
      required this.medicineName,
      required this.dose});

  factory MedicineAlertModel.fromJson(json) {
    List<AlertTimeModel> alertTimesList = (json['alert_times'] as List)
        .map((time) => AlertTimeModel.fromJson(time))
        .toList();
    return MedicineAlertModel(
        medicineName: json['medicine_name'],
        dose: json['medicine_dose'],
        alertID: json['alert_id'],
        alertTimes: alertTimesList);
  }
}

class AlertTimeModel {
  final int alertID;
  final int alertTimeID;
  final DateTime alertTime;

  AlertTimeModel(
      {required this.alertID,
      required this.alertTimeID,
      required this.alertTime});
  factory AlertTimeModel.fromJson(json) {
    return AlertTimeModel(
        alertID: json['alert_id'],
        alertTimeID: json['id'],
        alertTime: DateTime.parse(json['alert_time']));
  }
}
