import 'package:flutter/material.dart';
import 'package:med_eg/Views/reserve_doctor.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/doctor%20specialization%20model.dart';
import 'package:med_eg/models/doctorModel%20without%20token.dart';
import 'package:med_eg/services/doctor%20specialization%20service.dart';
import 'package:med_eg/services/get_all_doctors.dart';
import 'package:med_eg/widgets/customIconCard.dart';
import 'package:med_eg/widgets/find_doctor_card.dart';
import '../widgets/AutoCompleteSearch.dart';
import '../widgets/custom_arrow_back.dart';
import 'doctorBySpecialization.dart';

/* class FindDoctor extends StatefulWidget {
  const FindDoctor({super.key});
  final String id = 'FindDoctor';
  @override
  State<FindDoctor> createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  bool seeAll = false;
 List <DoctorModelWithoutToken> allDoctors = [];
  @override
  Widget build(BuildContext context) {
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
                const MySearchApp(),
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
                FutureBuilder<List<DoctorSpecializationModel>>(
                  future: DoctorSpecifyService().fetchSpecialization(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: SizedBox(
                        height: 10,
                      ));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      List<DoctorSpecializationModel> specializationList =
                          snapshot.data!;
                      List<DoctorSpecializationModel> displayedSpecializations =
                          seeAll
                              ? specializationList
                              : specializationList.take(11).toList();
                      return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount:
                              seeAll ? displayedSpecializations.length + 1 : 12,
                          itemBuilder: (context, index) {
                            if (seeAll &&
                                index == displayedSpecializations.length) {
                              return IconCard(
                                onTap: () {
                                  setState(() {
                                    seeAll = false;
                                  });
                                },
                                text: 'See Less',
                              );
                            } else if (!seeAll && index == 11) {
                              return IconCard(
                                  onTap: () {
                                    setState(() {
                                      seeAll = true;
                                    });
                                  },
                                  text: 'See All');
                            }
                            String text = displayedSpecializations[index].name;
                            return IconCard(
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorBySpecialization(specialization: text, allDoctors: allDoctors))),
                                text: text);
                          });
                    } else {
                      return const Center(child: Text('None'));
                    }
                  },
                ),
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
                FutureBuilder<List<DoctorModelWithoutToken>>(
                  future: GetAllDoctorService().GetAllDoctors(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(); // You can change this to a loading indicator if needed
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      List<DoctorModelWithoutToken> allDoctors = snapshot.data!;
                      return Column(
                        children: allDoctors.map((doctor) {
                          return Column(
                            children: [
                              Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(16),
                                child: FindDoctorCard(
                                  doctor: doctor,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context,  ReserveDoctor.id,
                                        arguments: {'doctor':doctor});
                                  },
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                            ],
                          );
                        }).toList(),
                      );
                    } else {
                      return const Center(child: Text('None'));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
} */
class FindDoctor extends StatefulWidget {
  const FindDoctor({super.key});
  final String id = 'FindDoctor';

  @override
  State<FindDoctor> createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  bool seeAll = false;
  List<DoctorModelWithoutToken> allDoctors = [];

  @override
  Widget build(BuildContext context) {
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
                const MySearchApp(),
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
                FutureBuilder<List<DoctorModelWithoutToken>>(
                  future: GetAllDoctorService().GetAllDoctors(context),
                  builder: (context, doctorSnapshot) {
                    if (doctorSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (doctorSnapshot.hasError) {
                      return Center(
                          child: Text('Error: ${doctorSnapshot.error}'));
                    } else if (doctorSnapshot.hasData) {
                      allDoctors = doctorSnapshot.data!;
                      return FutureBuilder<List<DoctorSpecializationModel>>(
                        future: DoctorSpecifyService().fetchSpecialization(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: SizedBox(
                                height: 10,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (snapshot.hasData) {
                            List<DoctorSpecializationModel> specializationList =
                                snapshot.data!;
                            List<DoctorSpecializationModel>
                                displayedSpecializations = seeAll
                                    ? specializationList
                                    : specializationList.take(11).toList();
                            return GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: seeAll
                                  ? displayedSpecializations.length + 1
                                  : 12,
                              itemBuilder: (context, index) {
                                if (seeAll &&
                                    index == displayedSpecializations.length) {
                                  /*  return IconCard(
                                    onTap: () {
                                      setState(() {
                                        seeAll = false;
                                      });
                                    },
                                    text: 'See Less',
                                  ); */
                                } else if (!seeAll && index == 11) {
                                  /*  return IconCard(
                                    image: ,
                                    onTap: () {
                                      setState(() {
                                        seeAll = true;
                                      });
                                    },
                                    text: 'See All',
                                  ); */
                                }
                                String text =
                                    displayedSpecializations[index].name;
                                /*   return IconCard(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoctorBySpecialization(
                                        specialization: text,
                                        allDoctors: allDoctors,
                                      ),
                                    ),
                                  ),
                                  text: text,
                                ); */
                              },
                            );
                          } else {
                            return const Center(child: Text('None'));
                          }
                        },
                      );
                    } else {
                      return const Center(child: Text('None'));
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Row(
                    children: [
                      const Text(
                        'All Doctors',
                        style: TextStyle(
                          color: darkBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.05,
                      ),
                      Expanded(
                        child: Container(
                          height: 0.5,
                          color: grey,
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<List<DoctorModelWithoutToken>>(
                  future: GetAllDoctorService().GetAllDoctors(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(); // You can change this to a loading indicator if needed
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      allDoctors = snapshot.data!;
                      return Column(
                        children: allDoctors.map((doctor) {
                          return Column(
                            children: [
                              Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(16),
                                child: FindDoctorCard(
                                  doctor: doctor,
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      ReserveDoctor.id,
                                      arguments: {'doctor': doctor},
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    } else {
                      return const Center(child: Text('None'));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
