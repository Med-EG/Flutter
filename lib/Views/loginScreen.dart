import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/signUP_with.dart';
import 'package:med_eg/Views/RestPassword.dart';

import '../widgets/custom_button.dart';


class Login extends StatefulWidget {
   const Login({super.key});
  final String id ='Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   

bool _obscureText = true;

  TextEditingController _passwordController = TextEditingController(text: '***');

  @override
  Widget build(BuildContext context) {
    
     double screenHieght = MediaQuery.of(context).size.height;
    

    return Scaffold(
     
      appBar: AppBar( backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
      elevation: 0,
      centerTitle: true,
      title: const Text('Login',style: TextStyle(fontSize: 20,color: Colors.black),) ,
      
         ),
         body: 
         ListView(
           children:[ Column(
            
             children: [
             const SizedBox(height:50),
               Padding(
                 padding: const EdgeInsets.only(right: 10,left: 10),
                 child: TextField(
                  onSubmitted:(value) {},
                  decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 23, horizontal: 15),
                        hintText: 'E-mail',
                        prefixIcon: const Icon(Icons.email_rounded),
                        label: const Text('Enter E-mail address'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: kPrimaryColor),
                        ),
                      ),
                 ),
               ),
               const SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.only(right: 10,left: 10),
                 child: TextField(
                  obscureText: _obscureText,
                  
                           onSubmitted:(value) {},
                           decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 23, horizontal: 15),
                    hintText: '********',
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    suffixIcon: IconButton(onPressed: (){setState(() {
                _obscureText = !_obscureText;
              });}, icon: Icon(_obscureText ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined)),
                    label: const Text('Enter password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: kPrimaryColor),
                    ),
                  ),
                          ),
               ),
                 const SizedBox(height: 10,),
           Row(
             children: [
              const Spacer(flex: 11,),
               GestureDetector(
                onTap: (){Navigator.pushNamed(context,const ResetPassword().id);},
                child: const Text('forget the password?',style: TextStyle(fontSize: 12,color: Colors.black),),
               ),
               const Spacer(flex: 1,)
             ],
           ),
           SizedBox(height: screenHieght*0.08,),
           CustomButton(text: 'Login', color: kPrimaryColor, onTap: () {
             Navigator.pushNamed(context,const Login().id);
           },),
           SizedBox(height: screenHieght*0.01,),
         
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               const Text('You don\'t have account?',style: TextStyle(fontSize: 12),),
               GestureDetector(onTap: (){},
               child: const Text('signup',style: TextStyle(color: Color(0xff5389e4),fontSize:12),),
               )
             ],
           ),
           SizedBox(height: screenHieght*0.06,),
           Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 74,
                          height: 1,
                          color: const Color(0xffB4BAC9),
                        ),
                        const Text(
                          ' Or ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xffB4BAC9)),
                        ),
                        Container(
                          width: 74,
                          height: 1,
                          color: const Color(0xffB4BAC9),
                        )
                      ],
                    ),
                     SizedBox(height: screenHieght*0.03,),

                    const SignUpWith(image: 'assets/images/facebook.png',text: 'Login with Facebook',),
                    SizedBox(height: screenHieght*0.02,),
                    
                    const SignUpWith(image: 'assets/images/facebook.png',text: 'Login with Google',),
                    SizedBox(height: screenHieght*0.02,),
                    
                    const SignUpWith(image: 'assets/images/facebook.png',text: 'Login with your E-mail',),
                      
                 
         
             ],
             
           ),]
         ),
         
    );
  }
}