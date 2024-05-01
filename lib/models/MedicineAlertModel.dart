class MedicineAlertModel {
  final String medicineName;
  final String dose;
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
  final String alertTime;

  AlertTimeModel(
      {required this.alertID,
      required this.alertTimeID,
      required this.alertTime});
  factory AlertTimeModel.fromJson(json) {
    return AlertTimeModel(
        alertID: json['alert_id'],
        alertTimeID: json['id'],
        alertTime:json['alert_time']);
  }
}

class MedicineAlertModelWithoutTimes {
  final String medicineName;
  final String dose;
  final int alertID;

  MedicineAlertModelWithoutTimes(
      {required this.medicineName, required this.dose, required this.alertID});

  factory MedicineAlertModelWithoutTimes.fromJson(json) {
    return MedicineAlertModelWithoutTimes(
      medicineName: json['medicine_name'],
      dose: json['medicine_dose'],
      alertID: json['alert_id'],
    );
  }
}
