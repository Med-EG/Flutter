import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/customWidgets/OnBoardingDots.dart';
import 'package:med_eg/models/onboardingmodel.dart';
import 'package:med_eg/screens/loginScreen.dart';

import '../customWidgets/custom_button.dart';


class OnBording extends StatelessWidget {
  OnBording({super.key});

  int currentIndex = 0;
  PageController _controller = PageController();
  String id='OnBording';

  @override
  Widget build(BuildContext context) {
     double screenHieght = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.white,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context,Login().id);
                },
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "SKIP",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ))
          ],
        ),
        body: Stack(children: [
          PageView.builder(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: onBoardingScreens.length,
              onPageChanged: (int index) {
                setState() {
                  index = currentIndex;
                }
              },
              itemBuilder: (context, index) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      
                        
                          Image.asset(
                              height: screenHieght*0.35, onBoardingScreens[index].imagePath),
              //                 Container(
              //               height: 30,
              //               width: 200,
              //               decoration: BoxDecoration(
                              
              // shape: BoxShape.circle,
              // boxShadow: [
                
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.3),
              //     spreadRadius: 50,
              //     blurRadius: 10,
              //     offset: Offset(0, 5)
              //             )]),
              //               ),
                        
                      
                       Padding(
                         padding: const EdgeInsets.only(bottom: 5),
                         child:  Container(height: screenHieght *0.03,child: Image.asset('assets/images/Ellipse 34 (1).png'),),
                       ),
                          
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Container(
                            
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(60)),
                                color: Color(0xffccdaf1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                 SizedBox(height: screenHieght*0.02),
                               
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [const Spacer(flex: 20,),OnBordingDots(dotColor: onBoardingScreens[index].firstDotColor),
                                  const Spacer(flex:1),
                                  OnBordingDots(dotColor: onBoardingScreens[index].secondDotColor),
                                  const Spacer(flex:1),
                                  OnBordingDots(dotColor: onBoardingScreens[index].thirdDotColor),
                                  const Spacer(flex:20),
                                    
                                  ],
                                ),
                                SizedBox(height: screenHieght*0.006),
                                Center(
                                  child: Text(textAlign:TextAlign.center,
                                    onBoardingScreens[index].homeBordingTitle,
                                    style: const TextStyle(
                                        color: Color(0xff213359),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 35),
                                  ),
                                ),
                                SizedBox(height: screenHieght*0.06),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, right: 30),
                                  child: Text(
                                    textAlign:TextAlign.center,
                                    onBoardingScreens[index]
                                        .homeBordingDescreption,
                                    style: const TextStyle(
                                        color: Color(0xff213359),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 25),
                                  ),
                                ),
                                 SizedBox(height: screenHieght*0.06),
                                onBoardingScreens[index]
                                        .isThisLastHomeBordingScreen
                                    ? CustomButton(
                                        text:  'Get Started',
                                        color: kPrimaryColor,
                                        onTap: () {
                                          Navigator.pushNamed(context, Login().id);
                                        },)
                                    : FloatingActionButton(
                                        onPressed: () {
                                          _controller.nextPage(
                                              duration:
                                                 const Duration(milliseconds: 500),
                                              curve: Curves.easeInOut);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        backgroundColor: kPrimaryColor,
                                        child: const Icon(Icons.arrow_forward_ios,
                                            color: Colors.white)),
                                            SizedBox(height: screenHieght*0.03),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]);
              }),
        ]));
  }
}
