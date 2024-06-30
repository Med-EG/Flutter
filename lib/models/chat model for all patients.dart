class ChatModelForAllPatients {
  final int chatId;
  final int doctorId;
  final int patientId;
  final String patientLastName;
  final String patientFirstName;
  final String patientImage;
  ChatModelForAllPatients(
      {required this.chatId,
      required this.doctorId,
      required this.patientId,
      required this.patientFirstName,
      required this.patientLastName,
      required this.patientImage});
  factory ChatModelForAllPatients.fromJson(json) {
    return ChatModelForAllPatients(
        chatId: json['chat_id'],
        patientId: json['patient_id'],
        doctorId: json['doctor_id'],
        patientFirstName: json['patient']['first_name'],
        patientLastName: json['patient']['last_name'],
        patientImage: json['patient']['personal_image']);
  }
}
