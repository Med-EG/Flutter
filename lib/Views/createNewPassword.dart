import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/Views/loginScreen.dart';
import 'package:med_eg/widgets/custom_circle_container.dart';

import '../widgets/custom_button.dart';

class CreateNewPassword extends StatefulWidget {
   const CreateNewPassword({super.key});
 final String id ='CreateNewPassword';

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool _obscureText = true;
  bool _obscureText2 = true;

 // TextEditingController _passwordController = TextEditingController(text: '***');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
                right: -80, top: -80, child: CustomCircleContainer()),
              const Positioned(
                left: -180, bottom: -180, child: CustomCircleContainer()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20,vertical: 60),
            child: Column(
              children: [
                Row(children: [ IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),const Spacer(flex: 1,)
                  ],),
                const Text(
                     'Create new password',
                     style: TextStyle(fontSize: 28, color: Color(0xff223A6A),fontWeight: FontWeight.bold),
                     
                   ),
                 const Spacer(flex: 2,),
          
                  Padding(  
                     padding : const EdgeInsets.only(right: 10,left: 10,bottom: 10),
                       child: TextField(
                        obscureText: _obscureText,
                        
                                 onSubmitted:(value) {},
                                 decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 23, horizontal: 15),
                          hintText: 'New password',
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          suffixIcon: IconButton(onPressed: (){setState(() {
                      _obscureText = !_obscureText;
                    });}, icon: Icon(_obscureText ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined)),
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: kPrimaryColor),
                          ),
                        ),
                                ),
                  ),
                  
                   Padding(  
                     padding :const EdgeInsets.only(right: 10,left: 10,top: 25),
                       child: TextField(
                        obscureText: _obscureText2,
                        
                                 onSubmitted:(value) {},
                                 decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 23, horizontal: 15),
                          hintText: 'Confirm new password',
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          suffixIcon: IconButton(onPressed: (){setState(() {
                      _obscureText2 =!_obscureText2;
                    });}, icon: Icon(_obscureText2 ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined)),
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: kPrimaryColor),
                          ),
                        ),
                                ),
                  ),
                  const Spacer(flex: 4,),
                  CustomButton(text: 'Reset the password', color: kPrimaryColor,onTap: () {
                    Navigator.pushNamed(context, const Login().id);
                  },),
                  const Spacer(flex: 5,)
              ],
            ),
          ),
        ],
      ),

    );
  }
}