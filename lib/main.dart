import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/Views/AlertScreen.dart';
import 'package:med_eg/Views/CreateMedicineAlert.dart';
import 'package:med_eg/Views/DoctorCalendar.dart';
import 'package:med_eg/Views/NoAlertScreen.dart';
import 'package:med_eg/Views/DoctorHomeScreen.dart';
import 'package:med_eg/Views/ShowAppointmentsInfoDoctor.dart';
import 'package:med_eg/Views/EnterVarifecationCode.dart';
import 'package:med_eg/Views/PatientHomeScreen.dart';
import 'package:med_eg/Views/PatientAppointmentsScreen.dart';
import 'package:med_eg/Views/RestPassword.dart';
import 'package:med_eg/Views/check_reservation.dart';
import 'package:med_eg/Views/chooseUserType.dart';
import 'package:med_eg/Views/createNewPassword.dart';
import 'package:med_eg/Views/edit_medicine_info.dart';
import 'package:med_eg/Views/find_doctor.dart';
import 'package:med_eg/Views/medical_record.dart';
import 'package:med_eg/Views/medical_record2%20for%20allergy.dart';
import 'package:med_eg/Views/medical_record2%20for%20disease.dart';
import 'package:med_eg/Views/medical_record2.dart';
import 'package:med_eg/Views/medical_record3.dart';
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
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/Views/test.dart';
import 'package:med_eg/Views/test2.dart';
import 'package:med_eg/cubits/AccountType/account_type_cubit.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/MedicalRecordCubit/medical_record_cubit.dart';
import 'package:med_eg/cubits/RegisterCubit/sign_up_cubit.dart';
import 'package:med_eg/widgets/testForm.dart';
import 'package:med_eg/cubits/MedicineAlert/medicine_alert_cubit.dart';
import 'package:med_eg/models/onboardingmodel.dart';
import 'Views/chat_screen.dart';
import 'Views/loginScreen.dart';
import 'Views/medical_record2 for operation.dart';
import 'Views/signUp4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
          const SignUp7().id: (context) => const SignUp7(),
          const SignUp8().id: (context) => const SignUp8(),
          const SignUp9().id: (context) => const SignUp9(),
          const SignUp10().id: (context) => const SignUp10(),
          const SignUp11().id: (context) => const SignUp11(),
          const SignUp12().id: (context) => const SignUp12(),
          Login().id: (context) => Login(),
          const ChatScreen().id: (context) => const ChatScreen(),
          const FindDoctor().id: (context) => const FindDoctor(),
          const MessageScreen().id: (context) => const MessageScreen(),
          ResetPassword().id: (context) => ResetPassword(),
          const EnterVerficationCode().id: (context) =>
              const EnterVerficationCode(),
          const CreateNewPassword().id: (context) => const CreateNewPassword(),
          const PatientHomeScreen().id: (context) => const PatientHomeScreen(),
          const NoPatientAppoointment().id: (context) =>
              const NoPatientAppoointment(),
          const ReserveDoctor().id: (context) => const ReserveDoctor(),
          const CheckReservation().id: (context) => const CheckReservation(),
          const ChooseUserType().id: (context) => const ChooseUserType(),
          const DoctorCalendar().id: (context) => const DoctorCalendar(),
          const ShowAppointmentInfoDoctor().id: (context) =>
              const ShowAppointmentInfoDoctor(),
          AlertScreen().id: (context) => AlertScreen(),
           DoctorHomeScreen().id:(context) => DoctorHomeScreen(),
          CreateMedicineAlert().id: (context) => CreateMedicineAlert(),
          ChooseUserType().id:(context) => ChooseUserType(),
          OnBording().id:(context) => OnBording(),
          Test2().id: (context) => Test2()

          const ShowAppointmentInfoDoctor().id: (context) =>
              const ShowAppointmentInfoDoctor(),
           const MedicalRecord().id: (context) =>  const MedicalRecord(),
          const MedicalRecord2().id: (context) => const MedicalRecord2(),
           MedicalRecord3.id: (context) => const MedicalRecord3(),
          const EditMedicineInfo().id: (context) => const EditMedicineInfo(),
          TestForm().id: (context) => TestForm(),
          const Profile03().id: (context) => const Profile03(),
          const NoAlertScreen().id: (context) => const NoAlertScreen(),
          const PatientProfile().id: (context) => const PatientProfile(),
          const MedicalRecord2ForDisease().id:(context) => const MedicalRecord2ForDisease(),
          const MedicalRecord2ForAllergy().id:(context) => const MedicalRecord2ForAllergy(),
          const MedicalRecord2ForOperation().id:(context) => const MedicalRecord2ForOperation(),
        },
        debugShowCheckedModeBanner: false,
        home: DoctorHomeScreen(),
      ),
    );
  }
}
    );
  }
}
