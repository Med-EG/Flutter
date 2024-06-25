import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/Views/AssistantViews/AssistantCalendar.dart';
import 'package:med_eg/Views/AssistantViews/ModifyAppointmentView.dart';
import 'package:med_eg/Views/CreateMedicineAlert.dart';
import 'package:med_eg/Views/DefaultView.dart';
import 'package:med_eg/Views/DoctorViews/Doctor%20Message.dart';
import 'package:med_eg/Views/DoctorViews/Doctor%20Profile.dart';
import 'package:med_eg/Views/DoctorViews/DoctorCalendar.dart';
import 'package:med_eg/Views/DoctorViews/DoctorChat.dart';
import 'package:med_eg/Views/DoctorViews/DoctorHomeScreen.dart';
import 'package:med_eg/Views/DoctorViews/SearchForMedicalRecordByFaceID.dart';
import 'package:med_eg/Views/DoctorViews/SearchForMedicalRecordByID.dart';
import 'package:med_eg/Views/DoctorViews/SearchForPatientMedicalRecord.dart';
import 'package:med_eg/Views/PatientAlertsScreen.dart';
import 'package:med_eg/Views/DoctorViews/ShowAppointmentsInfoDoctor.dart';
import 'package:med_eg/Views/DoctorViews/edit%20basic%20info%20for%20doctor.dart';
import 'package:med_eg/Views/ShowAppointmentsInfoDoctor.dart';
import 'package:med_eg/Views/EnterVarifecationCode.dart';
import 'package:med_eg/Views/PatientHomeScreen.dart';
import 'package:med_eg/Views/PatientAppointmentsScreen.dart';
import 'package:med_eg/Views/RestPassword.dart';
import 'package:med_eg/Views/check_reservation.dart';
import 'package:med_eg/Views/chooseUserType.dart';
import 'package:med_eg/Views/createNewPassword.dart';
import 'package:med_eg/Views/edit_medicine_info.dart';
import 'package:med_eg/Views/faqs_screen.dart';
import 'package:med_eg/Views/find_doctor.dart';
import 'package:med_eg/Views/medical_record.dart';
import 'package:med_eg/Views/medical_record2%20for%20allergy.dart';
import 'package:med_eg/Views/medical_record2%20for%20disease.dart';
import 'package:med_eg/Views/medical_record2%20for%20father.dart';
import 'package:med_eg/Views/medical_record2.dart';
import 'package:med_eg/Views/medical_record3.dart';
import 'package:med_eg/Views/medical_record_copy.dart';
import 'package:med_eg/Views/message_screen.dart';
import 'package:med_eg/Views/patient_profile.dart';
import 'package:med_eg/Views/profile03.dart';
import 'package:med_eg/Views/onBoarding.dart';
import 'package:med_eg/Views/reserve_doctor.dart';
import 'package:med_eg/Views/signUp1.dart';
import 'package:med_eg/Views/signUp10.dart';
import 'package:med_eg/Views/signUp11.dart';
import 'package:med_eg/Views/signUp12.dart';
import 'package:med_eg/Views/signUp2.dart';
import 'package:med_eg/Views/signUp3.dart';
import 'package:med_eg/Views/signUp6.dart';
import 'package:med_eg/Views/signUp7.dart';
import 'package:med_eg/Views/signUp8.dart';
import 'package:med_eg/Views/signUp9.dart';
import 'package:med_eg/Views/update_allergy_screen.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/controllers/notification_controller.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/MedicalRecordCubit/medical_record_cubit.dart';
import 'package:med_eg/cubits/Medicine%20Cubit/medicine_cubit.dart';
import 'package:med_eg/cubits/MedicineAlert/medicine_alert_cubit.dart';
import 'package:med_eg/cubits/MessageCubit/message_cubit.dart';
import 'package:med_eg/cubits/RegisterCubit/sign_up_cubit.dart';
import 'package:med_eg/widgets/testForm.dart';
import 'Views/chatTest.dart';
import 'Views/doctorBySpecialization.dart';
import 'Views/loginScreen.dart';
import 'Views/medical_record2 for mother.dart';
import 'Views/medical_record2 for operation.dart';
import 'Views/medical_record2 for second degree.dart';
import 'Views/signUp4.dart';
import 'Views/update_medicine_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic Notification',
        channelDescription: 'Basic Notification channel')
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group', channelGroupName: 'Basic Group')
  ]);
  bool isAllowedToSendNotification =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReciveMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReciveMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreateMethod,
    );
      onActionReceivedMethod: NotificationController.onActionReciveMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReciveMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreateMethod,
    );

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => MedicalRecordCubit(),
        ),
        BlocProvider(
          create: (context) => MedicineAlertCubit(),
        ),
        BlocProvider(
          create: (context) => MessageCubit(),
        ),
        BlocProvider(
          create: (context) => MedicineCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
                selectionColor: kPrimaryColor.withOpacity(0.5),
                selectionHandleColor: kPrimaryColor),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Encode Sans Expanded'),
        routes: {
          const SignUp1().id: (context) => const SignUp1(),
          const SignUp2().id: (context) => const SignUp2(),
          const SignUp3().id: (context) => const SignUp3(),
          const SignUp4().id: (context) => const SignUp4(),
          const SignUp6().id: (context) => const SignUp6(),
          SignUp7().id: (context) => SignUp7(),
          const SignUp8().id: (context) => const SignUp8(),
          const SignUp9().id: (context) => const SignUp9(),
          const SignUp10().id: (context) => const SignUp10(),
          const SignUp11().id: (context) => const SignUp11(),
          const SignUp12().id: (context) => const SignUp12(),
          Login().id: (context) => Login(),
          const FindDoctor().id: (context) => const FindDoctor(),
          const MessageScreen().id: (context) => const MessageScreen(),
          ResetPassword().id: (context) => ResetPassword(),
          const EnterVerficationCode().id: (context) =>
              const EnterVerficationCode(),
          const CreateNewPassword().id: (context) => const CreateNewPassword(),
          PatientHomeScreen().id: (context) => PatientHomeScreen(),
          const PatientAppoointment().id: (context) =>
              const PatientAppoointment(),
          const ReserveDoctor().id: (context) => const ReserveDoctor(),
          const PatientHomeScreen().id: (context) => const PatientHomeScreen(),
          const NoPatientAppoointment().id: (context) =>
              const NoPatientAppoointment(),
          const CheckReservation().id: (context) => const CheckReservation(),
          const ChooseUserType().id: (context) => const ChooseUserType(),
          const DoctorCalendar().id: (context) => const DoctorCalendar(),
          const ShowAppointmentInfoDoctor().id: (context) =>
              const ShowAppointmentInfoDoctor(),
          const DoctorHomeScreen().id: (context) => const DoctorHomeScreen(),
          const CreateMedicineAlert().id: (context) =>
              const CreateMedicineAlert(),
          const ChooseUserType().id: (context) => const ChooseUserType(),
          const OnBording().id: (context) => const OnBording(),
          const PatientProfile().id: (context) => const PatientProfile(),
          const ShowAppointmentInfoDoctor().id: (context) =>
              const ShowAppointmentInfoDoctor(),
          const MedicalRecord().id: (context) => const MedicalRecord(),
          const MedicalRecord2().id: (context) => const MedicalRecord2(),
          MedicalRecord3.id: (context) => const MedicalRecord3(),
          const EditMedicineInfo().id: (context) => const EditMedicineInfo(),
          TestForm().id: (context) => TestForm(),
          const Profile03().id: (context) => const Profile03(),
          const PatientProfile().id: (context) => const PatientProfile(),
          const MedicalRecord2ForDisease().id: (context) =>
              const MedicalRecord2ForDisease(),
          const MedicalRecord2ForAllergy().id: (context) =>
              const MedicalRecord2ForAllergy(),
          const MedicalRecord2ForOperation().id: (context) =>
              const MedicalRecord2ForOperation(),
          const SearchForPatientMedicalRecord().id: (context) =>
              const SearchForPatientMedicalRecord(),
          SearchForMedicalRecordByFaceID().id: (context) =>
              SearchForMedicalRecordByFaceID(),
          SearchForMedicalRecordByID().id: (context) =>
              SearchForMedicalRecordByID(),
          PatientAlertsScreen().id: (context) => PatientAlertsScreen(),
          DoctorAssistantCalendar().id: (context) => DoctorAssistantCalendar(),
          ModifyAppointment().id: (context) => ModifyAppointment(),
          DefaultView().id:(context) => DefaultView(),
          //  Test().id: (context) => Test(),
          const SearchForPatientMedicalRecord().id: (context) =>
              const SearchForPatientMedicalRecord(),
          const SearchForMedicalRecordByFaceID().id: (context) =>
              const SearchForMedicalRecordByFaceID(),
          SearchForMedicalRecordByID().id: (context) =>
              SearchForMedicalRecordByID(),
          ChatTest().id: (context) => ChatTest(),
          const DoctorProfile().id: (context) => const DoctorProfile(),
          const FAQSScreen().id: (context) => const FAQSScreen(),
          const EditBasicInfoForDoctor().id: (context) =>
              const EditBasicInfoForDoctor(),
          const MedicalRecordCopy().id: (context) => const MedicalRecordCopy(),
          const UpdateAllergyScreen().id: (context) =>
              const UpdateAllergyScreen(),
          const UpdateMedicineScreen().id: (context) =>
              const UpdateMedicineScreen(),
          DoctorBySpecialization.id: (context) => const DoctorBySpecialization(
                specialization: '',
                allDoctors: [],
              ),
          const MedicalRecord2ForFather().id: (context) =>
              const MedicalRecord2ForFather(),
          const MedicalRecord2ForMother().id: (context) =>
              const MedicalRecord2ForMother(),
          const MedicalRecord2ForSecondDegree().id: (context) =>
              const MedicalRecord2ForSecondDegree(),
              const DoctorMessage().id:(context) => const DoctorMessage(),
               DoctorChat().id:(context) =>  DoctorChat(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == ReserveDoctor.id) {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (context) {
              return ReserveDoctor(
                doctor: args['doctor'],
              );
            });
          }
          return null;
        },
        debugShowCheckedModeBanner: false,
        home: const OnBording(),
      ),
    );
  }
}
