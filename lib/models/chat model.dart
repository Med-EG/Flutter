class ChatModel {
  final int chatId;
  ChatModel({required this.chatId});
  factory ChatModel.fromJson(json) {
    return ChatModel(
      chatId: json['chat_id'],
    );
  }
}