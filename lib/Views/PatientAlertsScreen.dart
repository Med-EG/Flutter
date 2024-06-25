import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/Views/CreateMedicineAlert.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/cubits/MedicineAlert/medicine_alert_cubit.dart';
import 'package:med_eg/helper/NotificationHelper.dart';
import 'package:med_eg/models/MedicineAlertModel.dart';
import 'package:med_eg/services/get_MedicineALerts.dart';
import 'package:med_eg/widgets/CustomAddButton.dart';
import 'package:med_eg/widgets/custom_MedicineAlertCard.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class PatientAlertsScreen extends StatelessWidget {
  PatientAlertsScreen({super.key});
  final String id = 'PatientAlertsScreen';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<MedicineAlertCubit, MedicineAlertState>(
      listener: (context, state) {
        if(state is Loading)
        {
          isLoading=true;
        }
        else if(state is ShowAllMedicineAlerts)
        {
          isLoading=false;
        }
      },
      builder: (context, state) {
        NotificationHelper().notificationListCreation(context);
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: FutureBuilder<List<MedicineAlertModel>>(
              future: GetAllAlertsService().GetAllAlerts(context),
              builder: (BuildContext context,
                  AsyncSnapshot<List<MedicineAlertModel>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(
                              flex: 3,
                            ),
                            Row(
                              children: [
                                const CustomArrowBack(),
                                const Spacer(
                                  flex: 1,
                                ),
                                CustomAddButton(
                                  borderRadius: 18.0,
                                  plusIcon: true,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context,const CreateMedicineAlert().id);
                                  },
                                )
                              ],
                            ),
                           const Spacer(
                              flex: 1,
                            ),
                            const Text(
                              'My alerts',
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            Image.asset('assets/images/PNG/Paper Negative.png'),
                            const Spacer(
                              flex: 1,
                            ),
                            Text(
                              'No Alerts',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.grey.withOpacity(0.4),
                              ),
                            ),
                            const Spacer(
                              flex: 5,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  List<MedicineAlertModel> alerts = snapshot.data!;
                  return Center(
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(

                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Row(
                                    children: [
                                      const CustomArrowBack(),
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      CustomAddButton(
                                        borderRadius: 18.0,
                                        plusIcon: true,
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                              context,
                                             const CreateMedicineAlert().id);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'My Alerts',
                                  style: TextStyle(
                                    color: darkBlue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 10),
                                    child: SizedBox(
                                      height: 250,
                                      child: ListView.builder(
                                        itemCount: alerts.length,
                                        itemBuilder: (context, index) {
                                          return MedicineAlertCard(
                                              alert: alerts[index]);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ])));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        );
      },
    );
  }
}
