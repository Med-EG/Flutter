import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/Views/chat_screen.dart';
import 'package:med_eg/cubits/MessageCubit/message_cubit.dart';
import 'package:med_eg/models/message%20model.dart';
import 'package:med_eg/services/chatService.dart';
import 'package:med_eg/services/message%20service.dart';
import '../Views/chatTest.dart';
import '../constants/colors.dart';
import '../models/chat model.dart';

class MessageListTile extends StatelessWidget {
  const MessageListTile({super.key});
  @override
  Widget build(BuildContext context) {
    MessageModel? messageModel;
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: FutureBuilder<List<ChatModel>>(
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
                      onTap: () async{
                        BlocProvider.of<MessageCubit>(context).getAllMessages(url: 'https://api-medeg.online/api/medEG/message/chat/${chat.chatId}');
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

                      //trailing:
                      subtitle: FutureBuilder<List<MessageModel>>(
                        future: MessageService().getMessageById(context),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            List<MessageModel> messageList = snapshot.data!;
                            if (index >= messageList.length) {
                              return const Text('Nooooo');
                            }
                            final MessageModel messageees = messageList[index];
                            return Row(
                              children: [
                                Text(
                                  messageees.content,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: lightGrey,
                                      fontWeight: FontWeight.w500),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Text(
                                  '10:30 PM',
                                  style: TextStyle(
                                      color: lightGrey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ],
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
          }))),
    );
  }
}
