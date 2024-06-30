// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/message%20model.dart';
import 'package:med_eg/widgets/chat_bubble.dart';
import 'package:med_eg/widgets/custom_textFormField.dart';
import '../../cubits/LoginCubit/login_states.dart';
import '../../cubits/MessageCubit/message_cubit.dart';
import '../../widgets/custom_arrow_back.dart';
class DoctorChat extends StatelessWidget {
  DoctorChat({
    super.key,
  });
  final String id = 'DoctorChat';
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    List<MessageModel> listOfMessages =
        BlocProvider.of<MessageCubit>(context).listOfMessagesOfDoctor;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final chatId = args['chatId'];
    final patientFirstName = args['patientFirstName'];
    final patientLastName= args['patientLastName'];
    DoctorModel? doctor;
    final LoginState loginState = context.watch<LoginCubit>().state;
    if (loginState is SuccessDoctor) {
      doctor = loginState.doctor;
    }
    double screenWidth = MediaQuery.of(context).size.width;
     void scrollToBottom() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
      });
    }
    return SafeArea(
      child: BlocConsumer<MessageCubit, MessageState>(
        listener: (context, state) {
          if (state is MessageSuccessSendMessage) {
            _messageController.text = '';
            scrollToBottom();
          } else if (state is MessageFailureSendMessage) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Something error')));
            print(state.errMessage);
          } else if (state is DoctorMessageGetAll) {
listOfMessages = BlocProvider.of<MessageCubit>(context).listOfMessagesOfDoctor;
          } else if (state is MessageFailureGetMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to fetch messages')));
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
                      '$patientFirstName $patientLastName',
                      style: const TextStyle(
                          color: darkBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
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
                          if (doctor != null &&
                              _messageController.text.isNotEmpty) {
                            var sendMessage =
                                BlocProvider.of<MessageCubit>(context);
                            sendMessage.sendmessageMethodForDoctor(
                                doctorModel: doctor,
                                url:
                                    'https://api-medeg.online/api/medEG/message',
                                body: {
                                  'chat_id': chatId,
                                  'sender': doctor.id.toString(),
                                  'content': _messageController.text
                                });
                            print(_messageController.text);
                            print('Doctor id: ${doctor.id}');
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