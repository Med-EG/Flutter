class AppointmentModel {
  final String doctorFirstName;
  final String doctorLastName;
  final String doctorImage;
  final String date;

  const AppointmentModel({
      required this.doctorFirstName,
      required this.doctorLastName,
      required this.doctorImage,
      required this.date});

  factory AppointmentModel.fromJson(json) {
    return AppointmentModel(
        doctorFirstName: json['doctor']['first_name'],
        doctorLastName: json['doctor']['last_name'],
        doctorImage: json['doctor']['doctor_image'],
        date: json['created_at']);
  }
}
