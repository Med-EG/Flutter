class AppointmentModelForPatientSide {
  final int appointmentID;
  final String doctorFirstName;
  final String doctorLastName;
  final String doctorImage;
  final String date;
  final String time;

  const AppointmentModelForPatientSide(
      {required this.doctorFirstName,
      required this.appointmentID,
      required this.doctorLastName,
      required this.doctorImage,
      required this.date,
      required this.time});

  factory AppointmentModelForPatientSide.fromJson(json) {
    return AppointmentModelForPatientSide(
        time: json['appointment_time'],
        doctorFirstName: json['doctor']['first_name'],
        doctorLastName: json['doctor']['last_name'],
        doctorImage: json['doctor']['doctor_image'],
        date: json['appointment_day'],
        appointmentID: json['id']);
  }
}
