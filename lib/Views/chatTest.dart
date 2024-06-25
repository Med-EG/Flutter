// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/models/message%20model.dart';
import 'package:med_eg/widgets/chat_bubble.dart';
import 'package:med_eg/widgets/custom_textFormField.dart';
import '../cubits/LoginCubit/login_states.dart';
import '../cubits/MessageCubit/message_cubit.dart';
import '../models/paitentModel.dart';
import '../widgets/custom_arrow_back.dart';
class ChatTest extends StatelessWidget {
  ChatTest({
    super.key,
  });
  final String id = 'ChatTest';
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<MessageModel> listOfMessages =
        BlocProvider.of<MessageCubit>(context).listOfMessages;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final chatId = args['chatId'];
    final doctorFirstName = args['doctorFirstName'];
    final doctorLastName = args['doctorLastName'];
    PatientInfo? patient;
    final LoginState loginState = context.watch<LoginCubit>().state;
    if (loginState is SuccessPatient) {
      patient = loginState.patient;
    }
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocConsumer<MessageCubit, MessageState>(
        listener: (context, state) {
          if (state is MessageSuccess) {
            _messageController.text = '';
            print('Message Sent Succefully');
          } else if (state is MessageFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Something error')));
            print(state.errMessage);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomArrowBack(),
                    SizedBox(
                      width: screenWidth * 0.125,
                    ),
                    Text(
                      'Dr. $doctorFirstName $doctorLastName',
                      style: const TextStyle(
                          color: darkBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: listOfMessages.length,
                      itemBuilder: (context, index) {
                        return ChatBubbleBlue(
                          messageContent: listOfMessages[index],
                        );
                      }),
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextFormField(
                      label: 'type message here...',
                      controller: _messageController,
                    )),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          if (patient != null &&
                              _messageController.text.isNotEmpty) {
                            var sendMessage =
                                BlocProvider.of<MessageCubit>(context);
                            sendMessage.sendmessageMethodForPatient(
                                patientInfo: patient,
                                url:
                                    'https://api-medeg.online/api/medEG/message',
                                body: {
                                  'chat_id': chatId,
                                  'sender': patient.id.toString(),
                                  'content': _messageController.text
                                });
                            print(_messageController.text);
                            print('patient id: ${patient.id}');
                            print('chat id: $chatId');
                          } else {
                            print('send fail');
                          }
                        },
                      ),
                    )
                  ],
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
