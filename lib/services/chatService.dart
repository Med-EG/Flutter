import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/LoginCubit/login_cubit.dart';
import '../helper/API.dart';
import '../models/chat model.dart';
import '../models/paitentModel.dart';

class ChatService {
  Future<List<ChatModel>> getAllDoctorsForOnePatient(
      BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
       
      // PatientInfoWithoutToken patientId = await GetPatientByID().getPatientByID(context);
      List<dynamic> data = await Api().get(
          url: 'https://api-medeg.online/api/medEG/chat/patient/${patient!.id}',
          token: patient.token);
      List<ChatModel> chatList = [];
      for (int i = 0; i < data.length; i++) {
        ChatModel chat = ChatModel.fromJson(data[i]);
        chatList.add(chat);
      }
      return chatList;
    } catch (e) {
      print('Error fetching Chats: $e');
      return [];
    }
  }
}
