part of 'message_cubit.dart';

class MessageState {}

class MessageInitial extends MessageState {}

class PatientMessageGetAll extends MessageState {
  final List<MessageModel>? messagesPatient;
  PatientMessageGetAll({this.messagesPatient});
}
class DoctorMessageGetAll extends MessageState {
  final List<MessageModel>? messagesDoctor;
  DoctorMessageGetAll({this.messagesDoctor});
}
class MessageSuccessSendMessage extends MessageState {
  final MessageModel message;
  MessageSuccessSendMessage({required this.message});
}

class MessageFailureSendMessage extends MessageState {
  final String errMessage;

  MessageFailureSendMessage({required this.errMessage});
}
class MessageSuccessGetMessage extends MessageState {
  final MessageModel message;
  MessageSuccessGetMessage({required this.message});
}
class MessageFailureGetMessage extends MessageState {
  final String errMessage;

  MessageFailureGetMessage({required this.errMessage});
}
