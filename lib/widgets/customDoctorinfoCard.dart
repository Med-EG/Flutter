import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/doctorModel.dart';

class DoctorInfoCard extends StatelessWidget {
  const DoctorInfoCard(
      {super.key, required this.doctor,
      });
      final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 9,
        child: Container(
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(16),border: Border.all(color: Colors.grey.withOpacity(0.4))),
          width: 140,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network('https://api-medeg.online/${doctor.doctorImage}'),
              Text(
                doctor.doctorFirstName,
                style: const TextStyle(
                    color: darkBlue, fontWeight: FontWeight.bold),
              ),
             const SizedBox(height: 5,),
              Text(doctor.specification,
                  style:
                      TextStyle(color: const Color(0xFFa0b9e3).withOpacity(0.7))),
                      const SizedBox(height: 5,),
              Row(
                children: [
                  const Spacer(flex: 2),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:const Color(0xFFd7e1f4).withOpacity(0.5),),
                    width: 47,
                    height: 30,
                    
                    child: Row(
                      
                      children: [
                       
                        const Icon(
                          Icons.star_rounded,
                          color: kPrimaryColor,
                        ),
                        Text(
                          doctor.rating.toString(),
                          style: const TextStyle(color: kPrimaryColor,fontSize: 12),
                        )
                      ],
                    ),
                  ),
                 const Spacer(flex: 4,),
                 const Icon(Icons.location_on_rounded,color: lightGrey,),
                 const Spacer(flex: 1,),
                  Text(doctor.country,style:const TextStyle(color: lightGrey,fontSize: 13,),),
                 const Spacer(flex: 6,)
                ],
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
