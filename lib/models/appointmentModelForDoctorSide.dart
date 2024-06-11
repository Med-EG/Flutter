class AppointmentModelForDoctorSide {
  final int patientID;
  final int appointmentID;
  final String patientFirstName;
  final String patientLastName;
  final String patientImage;
  final String date;
  final String time;
  final int price;

  const AppointmentModelForDoctorSide(
      {required this.time,
      required this.price,
      required this.patientID,
      required this.appointmentID,
      required this.patientFirstName,
      required this.patientLastName,
      required this.patientImage,
      required this.date});

  factory AppointmentModelForDoctorSide.fromJson(json) {
    return AppointmentModelForDoctorSide(
        appointmentID: json['id'],
        price: json['price'],
        patientID: json['patient']['patient_id'],
        patientFirstName: json['patient']['first_name'],
        patientLastName: json['patient']['last_name'],
        patientImage: json['patient']['personal_image'],
        date: json['appointment_day'],
        time: json['appointment_time']);
  }
}
