import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/doctorModel%20without%20token.dart';
class FindDoctorCard extends StatelessWidget {
  const FindDoctorCard({super.key, this.onTap,required this.doctor});
  final void Function()? onTap;
  final DoctorModelWithoutToken doctor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black),
                       /*  child: Image.asset(
                          doctor!.doctorImage,
                          fit: BoxFit.cover,
                        ) */),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr.${doctor.doctorFirstName} ${doctor.doctorLastName}',
                        style: const TextStyle(
                            color: darkBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        doctor.specification,
                        style: const TextStyle(color: Color(0xff98B3E1)),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: grey,
                          ),
                          Text(
                            doctor.country,
                            style: const TextStyle(color: Color(0xff98B3E1)),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ));
            } 
            }
