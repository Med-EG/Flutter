// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/models/doctorModel.dart';
import '../cubits/LoginCubit/login_cubit.dart';
import '../helper/API.dart';
import '../models/chat model for all doctors.dart';
import '../models/chat model for all patients.dart';
import '../models/paitentModel.dart';

class ChatService {
  Future<List<ChatModelForAllDoctors>> getAllDoctorsForOnePatient(
      BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;

      // Fetch the data from the API
      List<dynamic>? data = await Api().get(
        url: 'https://api-medeg.online/api/medEG/chat/patient/${patient!.id}',
        token: patient.token,
      );

      // Check if data is null
      if (data == null) {
        print('Error: Data received from API is null');
        return [];
      }

      print(
          "The doctors chat for patient is $data"); // Check the response from the API

      // Use a map to store unique chats based on doctorId
      Map<int, ChatModelForAllDoctors> uniqueChats = {};

      // Process the data and store unique chats in the map
      /*    for (var item in data) {
      try {
        print('Processing item: $item'); // Debugging statement
        ChatModel chat = ChatModel.fromJson(item);
        uniqueChats[chat.doctorId] = chat;
      } catch (e) {
        print('Error processing chat item: $e');
        print('Item that caused the error: $item'); // Print the problematic item
      }
    } */
      for (int i = 0; i < data.length; i++) {
        try {
          print('Processing item: ${data[i]}'); // Debugging statement
          ChatModelForAllDoctors chat = ChatModelForAllDoctors.fromJson(data[i]);
          uniqueChats[chat.doctorId] = chat;
          print('print of iiii: $i');
        } catch (e, stacktrace) {
        print('Error processing chat item: $e');
        print('Stack trace: $stacktrace');
        print('Item that caused the error: ${data[i]}'); 
        }
      }

      print(
          'Unique chats: ${uniqueChats.values.toList()}'); // Print unique chats for debugging

      // Return the list of unique chats
      return uniqueChats.values.toList();
    } catch (e) {
      print('Error fetching Chats: $e');
      return [];
    }
  }

  Future<List<ChatModelForAllPatients>> getAllPatientsForOneDoctor(
      BuildContext context) async {
    try {
      DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
      List<dynamic> data = await Api().get(
          url: 'https://api-medeg.online/api/medEG/chat/doctor/${doctor!.id}',
          token: doctor.token);
      print('All patients is: $data');
      Map<int, ChatModelForAllPatients> uniqueChats = {};
      for (var item in data) {
        try {
          ChatModelForAllPatients chat = ChatModelForAllPatients.fromJson(item);
          uniqueChats[chat.patientId] = chat;
          print('Unique chats is: $uniqueChats');
        } catch (e) {
          print('There is no chats: $e');
        }
      }
      return uniqueChats.values.toList();
    } catch (e) {
      print('Error fetching Chats: $e');
      return [];
    }
  }
}
