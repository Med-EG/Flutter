import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helper/API.dart';
import '../../models/doctorModel.dart';
import '../../models/message model.dart';
import '../../models/paitentModel.dart';
part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());
 
  MessageModel? messageeForPatient;
    MessageModel? messageeForDoctor;
  List<MessageModel> listOfMessagesOfPatient = [];
  List<MessageModel> listOfMessagesOfDoctor = [];
  sendmessageMethodForPatient({
    required PatientInfo patientInfo,
    required dynamic body,
    required String url,
  }) async {
    try {
      emit(MessageInitial());
      final response =
          await Api().post(url: url, body: body, token: patientInfo.token);
      final message = MessageModel.fromJson(response);
      messageeForPatient = message;
      print('messagee is: $messageeForPatient');
      emit(MessageSuccessSendMessage(message: message));
    } catch (e) {
      emit(MessageFailureSendMessage(errMessage: '$e'));
    }
   
  }
    
    sendmessageMethodForDoctor({
    required DoctorModel doctorModel,
    required dynamic body,
    required String url,
  }) async {
    try {
      emit(MessageInitial());
      final response =
          await Api().post(url: url, body: body, token: doctorModel.token);
      final message = MessageModel.fromJson(response);
      messageeForDoctor = message;
      print('messagee is: $messageeForDoctor');
      emit(MessageSuccessSendMessage(message: message));
    } catch (e) {
      emit(MessageFailureSendMessage(errMessage: '$e'));
    }
  }

getAllMessagesOfPatien({required String url, required String token}) async {
  try {
    Map<String, dynamic> data = await Api().get(url: url, token: token);
    listOfMessagesOfPatient.clear();

    // Assuming the list of messages is under a key called 'messages'
    List<dynamic> messages = data['messages'];
    
    for (var item in messages) {
      listOfMessagesOfPatient.add(MessageModel.fromJson(item));
    }

       for (var message in listOfMessagesOfPatient) {
      print('Message: ${message.content}'); // Adjust to match your message fields
    }

    print('List of messages is: $listOfMessagesOfPatient');
    emit(PatientMessageGetAll(messagesPatient: listOfMessagesOfPatient));
  } catch (e) {
    print("the e of catch: $e");
    emit(MessageFailureGetMessage(errMessage: 'Fetching error is: $e'));
  }
}
getAllMessagesOfDoctor({required String url, required String token}) async {
  try {
    Map<String, dynamic> data = await Api().get(url: url, token: token);
    listOfMessagesOfDoctor.clear();

    // Assuming the list of messages is under a key called 'messages'
    List<dynamic> messages = data['messages'];
    
    for (var item in messages) {
      listOfMessagesOfDoctor.add(MessageModel.fromJson(item));
    }

       for (var message in listOfMessagesOfDoctor) {
      print('Message: ${message.content}'); // Adjust to match your message fields
    }

    print('List of messages is: $listOfMessagesOfDoctor');
    emit(DoctorMessageGetAll(messagesDoctor: listOfMessagesOfDoctor));
  } catch (e) {
    print("the e of catch: $e");
    emit(MessageFailureGetMessage(errMessage: 'Fetching error is: $e'));
  }
}

}
 /*  List<MessageModel> messageList = [];
      for (int i = 0; i < data.length; i++) {
        messageList.add(MessageModel.fromJson(data[i]));
          emit(MessageGetAll(messages: messageList));
      } */