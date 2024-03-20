import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/constants/colors.dart';
import '../widgets/custom_arrow_back.dart';

class FAQSScreen extends StatelessWidget {
  const FAQSScreen({super.key});
  final String id = 'FAQSScreen';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
                const CustomArrowBack(),
                SizedBox(
                  width: screenWidth * 0.25,
                ),
                SvgPicture.asset('assets/images/SVG/Frame (1).svg')
              ],
            ),
            const Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'FAQ',
                    style: TextStyle(
                        fontSize: 50,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: '\'S',
                    style: TextStyle(
                        fontSize: 50,
                        color: darkBlue,
                        fontWeight: FontWeight.bold))
              ])),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FaqsQuestions(
                      text1:
                          '1-What is the difference between a virus and a bacterium, and how are they treated differently?',
                      text2:
                          '. This question explores the distinction between viral and bacterial infections and their respective treatments, such as antibiotics for bacteria and antiviral medications for viruses.',
                    ),
                    FaqsQuestions(
                        text1:
                            '2-How can I prevent the spread of infectious diseases, especially during flu season?',
                        text2:
                            '. This question addresses preventive measures, such as vaccinations, good hygiene practices, and lifestyle choices, to reduce the risk of contracting and spreading infectious diseases.'),
                    FaqsQuestions(
                        text1:
                            '3-What are the warning signs of a heart attack, and when should I seek emergency medical attention?',
                        text2:
                            '. This question provides information on the common symptoms of a heart attack, such as chest pain, shortness of breath, and arm discomfort, and emphasizes the importance of seeking immediate medical help.'),
                    FaqsQuestions(
                        text1:
                            '4-What is the recommended frequency for health check-ups and screenings at different life stages?',
                        text2:
                            '. This question delves into the importance of regular health check-ups, screenings, and preventive care, emphasizing age-appropriate recommendations for screenings like mammograms, colonoscopies, and cholesterol checks.'),
                    FaqsQuestions(
                        text1:
                            '5-How can I manage stress and promote mental well-being in my daily life?',
                        text2:
                            '. This question explores strategies for stress management and mental well-being, including exercise, mindfulness, social support, and seeking professional help when needed.')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaqsQuestions extends StatelessWidget {
  const FaqsQuestions({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: grey),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text2,
            style: const TextStyle(fontSize: 18, color: grey),
          ),
        ),
      ],
    );
  }
}
