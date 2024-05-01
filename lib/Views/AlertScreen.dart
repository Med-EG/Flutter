import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/Views/test.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/cubits/MedicineAlert/medicine_alert_cubit.dart';
import 'package:med_eg/widgets/CustomAddButton.dart';
import 'package:med_eg/widgets/NoAlertNoAppoinmentBody.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class AlertScreen extends StatelessWidget {
  AlertScreen({super.key});
  final String id = 'AlertScreen';
  bool isLoading = false;
  bool showData=false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicineAlertCubit, MedicineAlertState>(
      listener: (context, state) {
        if (state is Loading) {
          isLoading = true;
        }
        if (state is CreateNewMedicineALert) {
          Navigator.pushNamed(context, Test().id);
        }
        if (state is ShowAllMedicineAlerts)
        {
          showData=true;
        }
        if (state is NoAlertsToShow)
        {
          showData=false;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: [
                        const CustomArrowBack(),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Medicine ',
                              style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Alert',
                              style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        CustomAddButton(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Test().id);
                          },
                          borderRadius: 40,
                          plusIcon: true,
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    NoAlertNoAppoinmentBody(noWahtText: 'noWahtText'),
                    const Spacer(
                      flex: 4,
                    ),
                   
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

