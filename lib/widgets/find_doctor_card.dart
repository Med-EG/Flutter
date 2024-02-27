import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';

class FindDoctorCard extends StatelessWidget {
  const FindDoctorCard({super.key, this.onTap});
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.black),
                child: Image.asset(
                  'assets/images/PNG/Dr.png',
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr.Mohamed Essa',
                style: TextStyle(
                    color: darkBlue, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                'psychologist',
                style: TextStyle(color: Color(0xff98B3E1)),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: grey,
                  ),
                  Text(
                    'Cairo',
                    style: TextStyle(color: Color(0xff98B3E1)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
