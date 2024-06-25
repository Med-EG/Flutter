class ChatModel {
  final int chatId;
  final int doctorId;
  final int patientId;
  final String doctorLastName;
  final String doctorFirstName;
  final String doctorImage;
    final String patientLastName;
  final String patientFirstName;
  final String patientImage;
  ChatModel(
      {required this.doctorLastName,
      required this.doctorFirstName,
      required this.doctorImage,
      required this.chatId,
      required this.doctorId,
      required this.patientId,
      required this.patientFirstName,
      required this.patientLastName,
      required this.patientImage});
  factory ChatModel.fromJson(json) {
    return ChatModel(
      chatId: json['chat_id'],
      patientId: json['patient_id'],
      doctorId: json['doctor_id'],
      doctorFirstName: json['doctor']['first_name'],
      doctorLastName: json['doctor']['last_name'],
      doctorImage: json['doctor']['doctor_image'],
      patientFirstName: json['patient']['first_name'],
      patientLastName: json['patient']['last_name'],
      patientImage: json['patient']['personal_image']
    );
  }
}
