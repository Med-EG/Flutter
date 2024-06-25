import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/paitentModel.dart';
import '../cubits/LoginCubit/login_cubit.dart';
import '../models/message model.dart';

class MessageService{
  Future <MessageModel> sendMessage({
    required int chatId,
    required int sender,
    required String content,
    required PatientInfo patient
  }) async{
    try{
      final response = await Api().post(url: 'https://api-medeg.online/api/medEG/message', 
      body: {
        'chat_id':chatId.toString(),
        'sender': sender.toString(),
        'content':content
      },
      token: patient.token);
      final message = MessageModel.fromJson(response);
      return message;
    }
    catch(e)
    {
      print('Error sending message: $e');
      throw e;
    }
  }
 Future<List<MessageModel>> getMessageById(
      BuildContext context, int chatId) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      List<dynamic> data = await Api().get(
          url: 'https://api-medeg.online/api/medEG/message/chat/$chatId',
          token: patient!.token);
      List<MessageModel> messages = data.map((json) => MessageModel.fromJson(json)).toList();
      return messages;
      // for (int i = 0; i < data.length; i++) 
     /*  for(var item in data){
        MessageModel outMessage = MessageModel.fromJson(item);
        messageList.add(outMessage);
      }
      return messageList; */
    } catch (e) {
      print('Error fetching messages: $e');
      return [];
    }
  }
   
}


/*  Future<List<MessageModel>> getOperationInfoService(BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
       DoctorModel?doctor=BlocProvider.of<LoginCubit>(context).doctor;

      MedicalRecordModel medicalRecord = await GetBasicMedicalInfo().getBasicMedicalInfo(context);
      List<dynamic> data = await Api().get(
          url:
              'https://api-medeg.online/api/medEG/operation-info/rec/${medicalRecord.medicalId}',
          token: patient?.token??doctor?.token);

      List<MessageModel> messageList = [];
      for (int i = 0; i < data.length; i++) {
        messageList.add(MessageModel.fromJson(data[i]));
      }
      return messageList;
    } catch (e) {
      print('Error fetching operations: $e');
      return [];
    }
  } */