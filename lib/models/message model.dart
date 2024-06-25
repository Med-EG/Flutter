// ignore_for_file: file_names

class MessageModel {
  final int messageId;
  final int sender;
  final String content;
  final String createdAt;
  MessageModel(
      {required this.messageId, required this.sender, required this.content, required this.createdAt});
  factory MessageModel.fromJson(json) {
    return MessageModel(
      messageId: json['message_id'],
      sender: json['sender'],
      content: json['content'],
      createdAt: json['created_at']
    );
  }
}
