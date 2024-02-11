import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/Views/createNewPassword.dart';

import '../widgets/custom_button.dart';


class EnterVerficationCode extends StatelessWidget {
   EnterVerficationCode({super.key});

String id ='EnterVerficationCode';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        elevation: 0,
      ),
      body: Column(
        children: [
          const Padding(
             padding:  EdgeInsets.only(right: 40),
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
                  onChanged: (value) {
                    if(value.length==1)
                    {
                        FocusScope.of(context).nextFocus();
                    }
                  },
                style: Theme.of(context).textTheme.headline6,
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
                  style: Theme.of(context).textTheme.headline6,
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
                  style: Theme.of(context).textTheme.headline6,
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
                  style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration(border : OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center ,
                inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
        
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Didn\'t receive verfication?',style: TextStyle(color: Colors.black),),
                    GestureDetector(onTap: (){},
                    
                    child: const Text('Resend',style: TextStyle(color: kPrimaryColor),),)
                  ],
                ),
          ),
          const Spacer(flex: 5,),
          CustomButton(text: 'Reset the password', color: kPrimaryColor,
         onTap: () {
           Navigator.pushNamed(context, CreateNewPassword().id);
         },
         ),
         const Spacer(flex: 4,)
        ],
      ),


    );
  }
}