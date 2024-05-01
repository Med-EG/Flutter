part of 'message_cubit.dart';

class MessageState {}

class MessageInitial extends MessageState {}

class MessageGetAll extends MessageState {
  final List<MessageModel>? messages;
  MessageGetAll({this.messages});
}

class MessageSuccess extends MessageState {
  final MessageModel message;
  MessageSuccess({required this.message});
}

class MessageFailure extends MessageState {
  final String errMessage;

  MessageFailure({required this.errMessage});
}
