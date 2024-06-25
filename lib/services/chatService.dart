// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/models/doctorModel.dart';
import '../cubits/LoginCubit/login_cubit.dart';
import '../helper/API.dart';
import '../models/chat model.dart';
import '../models/paitentModel.dart';

class ChatService {
  Future<List<ChatModel>> getAllDoctorsForOnePatient(
      BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;

      List<dynamic> data = await Api().get(
          url: 'https://api-medeg.online/api/medEG/chat/patient/${patient!.id}',
          token: patient.token);
      Map<int, ChatModel> uniqueChats = {};
      for (var item in data) {
        ChatModel chat = ChatModel.fromJson(item);
        uniqueChats[chat.doctorId] = chat;
      }
      return uniqueChats.values.toList();
    } catch (e) {
      print('Error fetching Chats: $e');
      return [];
    }
  }

  Future<List<ChatModel>> getAllPatientsForOneDoctor(
      BuildContext context) async {
    try {
      DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
      List<dynamic> data = await Api().get(
          url: 'https://api-medeg.online/api/medEG/chat/doctor/${doctor!.id}',
          token: doctor.token);
           
      Map<int, ChatModel> uniqueChats = {};
      for (var item in data) {
        ChatModel chat = ChatModel.fromJson(item);
        uniqueChats[chat.patientId] = chat;
      }
      return uniqueChats.values.toList();
    } catch (e) {
      print('Error fetching Chats: $e');
      return [];
    }
  }
}
