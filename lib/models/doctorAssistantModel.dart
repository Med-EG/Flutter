class DoctorAssistant {
  final String name;
  final int id;
  final int doctorID;
  final String token;

  DoctorAssistant(
      {required this.name, required this.id, required this.doctorID,required this.token});

  factory DoctorAssistant.fromJson(json) {
    return DoctorAssistant(
        name: json['assistant']['assistant_name'],
        id: json['assistant']['assistant_id'],
        doctorID: json['assistant']['doctor_id'],
        token: json['token']);
  }
}
