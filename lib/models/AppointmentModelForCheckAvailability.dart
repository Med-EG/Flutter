class AppointmentModelForCheckAvailability {
  final String date;
  final String time;
  final int id;

  AppointmentModelForCheckAvailability(
      {required this.date, required this.time, required this.id});
 factory AppointmentModelForCheckAvailability.fromJson(Map<String, dynamic> json) {
  try {
    return AppointmentModelForCheckAvailability(
      date: json['appointment_day'] ?? '', // Provide a default value if 'appointment_day' is missing
      time: json['appointment_time'] ?? '', // Provide a default value if 'appointment_time' is missing
      id: json['id'] ?? 0, // Provide a default value if 'id' is missing
    );
  } catch (e) {
    // Handle any errors that occur during parsing
    print('Error parsing appointmentModelForCheckAvailability: $e');
    return AppointmentModelForCheckAvailability(
      date: '',
      time: '',
      id: 0,
    );
  }
}

}
