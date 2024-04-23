import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/Views/createNewPassword.dart';
import 'package:med_eg/widgets/custom_circle_container.dart';

import '../widgets/custom_button.dart';


class EnterVerficationCode extends StatefulWidget {
   const EnterVerficationCode({super.key});
   final String id ='EnterVerficationCode';

  @override
  State<EnterVerficationCode> createState() => _EnterVerficationCodeState();
}

class _EnterVerficationCodeState extends State<EnterVerficationCode> {


late FocusNode _focusNode;
@override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    
    // Open the keyboard when the screen is opened
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        children:[
            const Positioned(
                right: -80, top: -80, child: CustomCircleContainer()),
              const Positioned(
                left: -180, bottom: -180, child: CustomCircleContainer()),
           Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: Padding(
            padding: const EdgeInsets.only(top:60),
            child: Column(
              children: [
                Row(children: [const Spacer(flex: 1,), IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),const Spacer(flex: 25,)
                  ],),
                const Padding(
                   padding:  EdgeInsets.only(left: 30,right: 30,top:20),
                   child:  Text(
                        'Enter verification code',
                        style: TextStyle(fontSize: 28, color: Color(0xff223A6A),),
                        
                      ),
                 ),
                 const Spacer(flex: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      
                      height: 68,
                      width: 64,
                      child: TextField(
                         focusNode: _focusNode,
                        onChanged: (value) {
                          if(value.length==1)
                          {
                              FocusScope.of(context).nextFocus();
                          }
                        },
                      style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(border : OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center ,
                      inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                     SizedBox(
                      height: 68,
                      width: 64,
                      child: TextField(
                       
                         onChanged: (value) {
                          if(value.length==1)
                          {
                              FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(border : OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center ,
                      inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                     SizedBox(
                      height: 68,
                      width: 64,
                      child: TextField(
                         onChanged: (value) {
                          if(value.length==1)
                          {
                              FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(border : OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center ,
                      inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                     SizedBox(
                      height: 68,
                      width: 64,
                      child: TextField(
                         onChanged: (value) {
                          if(value.length==1)
                          {
                              FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(border : OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center ,
                      inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                  ],
                ),
              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Didn\'t receive verfication?',style: TextStyle(color: Colors.black),),
                          GestureDetector(onTap: (){},
                          
                          child: const Text('Resend',style: TextStyle(color: kPrimaryColor),),)
                        ],
                      ),
                ),
                const Spacer(flex: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: CustomButton(text: 'Reset the password', color: kPrimaryColor,
                               onTap: () {
                   Navigator.pushNamed(context, const CreateNewPassword().id);
                               },
                               ),
                ),
               const Spacer(flex: 4,)
              ],
            ),
          ),
        ),
  ]    ),


    );
  }
}