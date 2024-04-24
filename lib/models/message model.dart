class MessageModel {
  final int messageId;
  final int sender;
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
