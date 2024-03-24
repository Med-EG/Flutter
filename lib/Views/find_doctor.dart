import 'package:flutter/material.dart';
import 'package:med_eg/Views/reserve_doctor.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/list_images_texts.dart';
import 'package:med_eg/widgets/customIconCard.dart';
import 'package:med_eg/widgets/custom_textFormField.dart';
import 'package:med_eg/widgets/find_doctor_card.dart';
import '../widgets/custom_arrow_back.dart';

class FindDoctor extends StatelessWidget {
  const FindDoctor({super.key});
  final String id = 'FindDoctor';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    CustomArrowBack(),
                    Text(
                      'Find Doctor',
                      style: TextStyle(
                          color: darkBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const CustomTextFormField(
                    label: 'Search doctors , articles ....'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 16,
                        color: darkBlue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 16),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      String imageUrl = imageUrls[index];
                      String text = texts[index];
                      return IconCard(
                          onTap: () => Navigator.pushNamed(
                              context, const ReserveDoctor().id),
                          image: imageUrl,
                          text: text);
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Row(
                    children: [
                      const Text(
                        'All Doctors',
                        style: TextStyle(
                            color: darkBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: screenWidth * 0.05,
                      ),
                      Expanded(
                        child: Container(
                          height: 0.5,
                          color: grey,
                        ),
                      )
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(16),
                        child:  FindDoctorCard(
                          onTap: () {
                            Navigator.pushNamed(context, const ReserveDoctor().id);
                          },
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: screenHeight * 0.05);
                  },
                  itemCount: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}