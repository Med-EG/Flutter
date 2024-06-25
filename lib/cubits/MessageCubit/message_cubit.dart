import 'package:bloc/bloc.dart';
import '../../helper/API.dart';
import '../../models/doctorModel.dart';
import '../../models/message model.dart';
import '../../models/paitentModel.dart';
part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());
  DoctorModel? doctor;
  PatientInfo? patient;
  MessageModel? messagee;
  List<MessageModel> listOfMessages = [];
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
      messagee = message;
      print('messagee is: $messagee');
      emit(MessageSuccess(message: message));
    } catch (e) {
      //emit(MessageFailure(errMessage: '$e'));
    }
    /* if (statusCode == 200 || statusCode == 201) {
        // Check for success code
        final message = MessageModel.fromJson(response.data);
        messagee = message;
        emit(MessageSuccess(message: message));
      } else {
        // Handle non-success responses
        final errorMessage = response.data['message'] ??
            'API error'; // Extract error message if available
        emit(MessageFailure(errMessage: errorMessage));
      } */
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
      messagee = message;
      print('messagee is: $messagee');
      emit(MessageSuccess(message: message));
    } catch (e) {
      //emit(MessageFailure(errMessage: '$e'));
    }
  }

  getAllMessages({required String url}) async {
    try {
      List<dynamic> data = await Api().get(url: url, token: patient?.token ?? doctor!.token);
      List<MessageModel> messageList = [];
      for (int i = 0; i < data.length; i++) {
        messageList.add(MessageModel.fromJson(data[i]));
      }

      emit(MessageGetAll(messages: messageList));
    } catch (e) {
      emit(MessageFailure(errMessage: 'Fetching error is: $e'));
    }
  }
}
