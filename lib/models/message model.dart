// ignore_for_file: file_names

class MessageModel {
  final int messageId;
  final String sender;
  final String content;
  MessageModel(
      {required this.messageId, required this.sender, required this.content});
  factory MessageModel.fromJson(json) {
    return MessageModel(
      messageId: json['message_id'],
      sender: json['sender'],
      content: json['content'],

    );
  }
}
