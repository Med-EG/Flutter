import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/MessageCubit/message_cubit.dart';
import 'package:med_eg/services/chatService.dart';
import '../Views/DoctorViews/DoctorChat.dart';
import '../Views/chatTest.dart';
import '../constants/colors.dart';
import '../models/chat model for all doctors.dart';
import '../models/chat model for all patients.dart';
import '../models/doctorModel.dart';
import '../models/paitentModel.dart';

class MessageListTileForPatient extends StatelessWidget {
  const MessageListTileForPatient({super.key});
  @override
  Widget build(BuildContext context) {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: FutureBuilder<List<ChatModelForAllDoctors>>(
          future: ChatService().getAllDoctorsForOnePatient(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.hasError}');
            } else if (snapshot.hasData) {
              List<ChatModelForAllDoctors> chatList = snapshot.data!;
              print('chatList is $chatList');
              if (chatList.isEmpty) {
                return const Center(
                    child: Text(
                  'No Chats to Show',
                  style: TextStyle(fontSize: 20, color: kPrimaryColor),
                ));
              }

              return ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  final ChatModelForAllDoctors chat = chatList[index];
                  return Container(
                    width: screenWidth,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: lightGrey, width: 1)),
                    ),
                    child: ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                              fit: BoxFit.cover,
                              'https://api-medeg.online/${chat.doctorImage}'),
                        ),
                      ),
                      title: Text(
                        '${chat.doctorFirstName} ${chat.doctorLastName}', // Assuming DoctorModel has a 'name' property
                        style: const TextStyle(
                            color: darkBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onTap: () async {
                        BlocProvider.of<MessageCubit>(context)
                            .getAllMessagesOfPatien(
                                url:
                                    'https://api-medeg.online/api/medEG/message/chat/${chat.chatId}',
                                token: patient!.token);

                        final chatId =
                            chat.chatId; // Use null-conditional operator
                        if (chatId != null) {
                          final arguments = {
                            'chatId': chat.chatId,
                            'doctorFirstName': chat.doctorFirstName,
                            'doctorLastName': chat.doctorLastName,
                          };
                          Navigator.pushNamed(context, ChatTest().id,
                              arguments: arguments);
                        } else {
                          // Handle case where chatId is null (e.g., show an error message)
                          print('Chat ID unavailable');
                        }
                      },
                    ),
                  );
                },
              );
            }
            return const Text('No Data',
                style: TextStyle(fontSize: 20, color: Colors.blue));
          }),
    );
  }
}

class MessageListTileForDoctor extends StatelessWidget {
  const MessageListTileForDoctor({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
    return Expanded(
      child: FutureBuilder<List<ChatModelForAllPatients>>(
          future: ChatService().getAllPatientsForOneDoctor(context),
          builder: (((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              List<ChatModelForAllPatients> chatList = snapshot.data!;
              if (chatList.isEmpty) {
                return const Center(
                  child: Text(
                    'There is no chats',
                    style: TextStyle(color: grey),
                  ),
                );
              }
              return ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  final ChatModelForAllPatients chat = chatList[index];
                  return Container(
                    width: screenWidth,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: lightGrey, width: 1)),
                    ),
                    child: ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                              fit: BoxFit.cover,
                              'https://api-medeg.online/${chat.patientImage}'),
                        ),
                      ),
                      title: Text(
                        '${chat.patientFirstName} ${chat.patientLastName}', // Assuming DoctorModel has a 'name' property
                        style: const TextStyle(
                            color: darkBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onTap: () async {
                        BlocProvider.of<MessageCubit>(context)
                            .getAllMessagesOfDoctor(
                                url:
                                    'https://api-medeg.online/api/medEG/message/chat/${chat.chatId}',
                                    token: doctor!.token
                                    );
                        final chatId =
                            chat.chatId; // Use null-conditional operator
                        if (chatId != null) {
                          final arguments = {
                            'chatId': chat.chatId,
                            'patientFirstName': chat.patientFirstName,
                            'patientLastName': chat.patientLastName,
                          };
                          Navigator.pushNamed(context, DoctorChat().id,
                              arguments: arguments);
                        } else {
                          // Handle case where chatId is null (e.g., show an error message)
                          print('Chat ID unavailable');
                        }
                      },
                    ),
                  );
                },
              );
            }
            return const Text('No Data');
          }))),
    );
  }
}

/* child: FutureBuilder<List<ChatModel>>(
          future: ChatService().getAllDoctorsForOnePatient(context),
          builder: (((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              List<ChatModel> chatList = snapshot.data!;
              if (chatList.isEmpty) {
                return const Center(
                  child: Text(
                    'There is no chats',
                    style: TextStyle(color: grey),
                  ),
                );
              }
              return ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  final ChatModel chat = chatList[index];
                  return Container(
                    width: screenWidth,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: lightGrey, width: 1)),
                    ),
                    child: ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                              fit: BoxFit.cover,
                              'https://api-medeg.online/${chat.doctorImage}'),
                        ),
                      ),
                      title: Text(
                        '${chat.doctorFirstName} ${chat.doctorLastName}', // Assuming DoctorModel has a 'name' property
                        style: const TextStyle(
                            color: darkBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onTap: () async {
                        BlocProvider.of<MessageCubit>(context).getAllMessages(
                            url:
                                'https://api-medeg.online/api/medEG/message/chat/${chat.chatId}');
                        final chatId =
                            chat.chatId; // Use null-conditional operator
                        if (chatId != null) {
                          final arguments = {
                            'chatId': chat.chatId,
                            'doctorFirstName': chat.doctorFirstName,
                            'doctorLastName': chat.doctorLastName,
                          };
                          Navigator.pushNamed(context, ChatTest().id,
                              arguments: arguments);
                        } else {
                          // Handle case where chatId is null (e.g., show an error message)
                          print('Chat ID unavailable');
                        }
                      },

                      //trailing :
                      subtitle: FutureBuilder<List<MessageModel>>(
                        future: MessageService()
                            .getMessageById(context, chat.chatId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            List<MessageModel> messageList = snapshot.data!;
                            if (messageList.isEmpty) {
                              return const Text(
                                "In progress...",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: lightGrey,
                                    fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              );
                            }
                            final MessageModel lastMessage = messageList.last;
                            return SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      lastMessage.content,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: lightGrey,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    lastMessage.createdAt,
                                    style: const TextStyle(
                                        color: lightGrey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            );
                          }
                          return const Text(
                            'No Messages',
                            style: TextStyle(
                                fontSize: 12,
                                color: lightGrey,
                                fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }
            return const Text('No Data');
          }))), */
