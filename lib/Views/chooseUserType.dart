import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/Views/loginScreen.dart';
import 'package:med_eg/cubits/AccountType/account_type_cubit.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import '../widgets/custom_button.dart';

class ChooseUserType extends StatelessWidget {
  const ChooseUserType({super.key});
  final String id = 'ChooseUserType';

  @override
  Widget build(BuildContext context) {
    double screenHieght = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(27),
            child: Column(
              children: [
                SizedBox(
                  height: screenHieght * 0.06,
                ),
                SizedBox(
                    height: screenHieght * 0.3,
                    width: screenWidth * 0.4,
                    child: SvgPicture.asset('assets/images/SVG/Frame (1).svg')),
                SizedBox(
                  height: screenHieght * 0.007,
                ),
                const Text(
                  'You are a...',
                  style: TextStyle(
                      fontSize: 35,
                      color: darkBlue,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHieght * 0.08,
                ),
                CustomButton(
                  text: 'Patient',
                  color: kPrimaryColor,
                  onTap: () {
                    BlocProvider.of<LoginCubit>(context).x=1;
                    Navigator.pushReplacementNamed(context, Login().id,
              arguments: 'https://api-medeg.online/api/medEG/patient/login');
                  },
                ),
                SizedBox(
                  height: screenHieght * 0.035,
                ),
                
                CustomButton(
                  text: 'Doctor',
                  color: kPrimaryColor,
                  onTap: () {
                    BlocProvider.of<LoginCubit>(context).x=2;
                    Navigator.pushReplacementNamed(context, Login().id,
                        arguments:
                            'https://api-medeg.online/api/medEG/doctor/login');
                  },
                ),
                SizedBox(
                  height: screenHieght * 0.035,
                ),
                CustomButton(
                  text: 'Doctor assistant',
                  color: kPrimaryColor,
                  onTap: () {
                   
                  },
                )
              ],
            ),
          ),
        );
      }
    
  }

