import 'package:flutter/material.dart';
import 'package:med_eg/models/doctorModel%20without%20token.dart';
import 'package:med_eg/services/get_all_doctors.dart';
import 'package:med_eg/widgets/customDoctorinfoCard.dart';

class DoctorCardListView extends StatelessWidget {
  const DoctorCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        child: FutureBuilder<List<DoctorModelWithoutToken>>(
          future: GetAllDoctorService().GetAllDoctors(context),
          builder: (BuildContext context,
              AsyncSnapshot<List<DoctorModelWithoutToken>> snapshot) {
            if (snapshot.hasData) {
              List<DoctorModelWithoutToken> doctors = snapshot.data!;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    return DoctorInfoCard(doctor: doctors[index]);
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
